import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/pos/syncing/services/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/syncing/services/sync_service.dart';

part 'operation_sync_event.dart';
part 'operation_sync_state.dart';
part 'operation_sync_bloc.freezed.dart';

class OperationSyncBloc extends Bloc<OperationSyncEvent, OperationSyncState> {
  final SyncService _syncService;
  final ConnectivityService _connection;

  Timer? _syncTimer;
  Timer? _tickTimer;

  OperationSyncBloc({required SyncService syncService, required ConnectivityService connection})
      : _syncService = syncService,
        _connection = connection,
        super(const OperationSyncState.initial()) {
    on<_StartPeriodicSync>(_onStartPeriodicSync);
    on<_SyncNow>(_onSyncNow);
    on<_Tick>(_onTick);

    _tickTimer?.cancel();
    _tickTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      add(const OperationSyncEvent.tick());
    });
  }

  Future<void> _onStartPeriodicSync(_StartPeriodicSync event, Emitter<OperationSyncState> emit) async {
    // Cancel any existing timer
    _syncTimer?.cancel();

    // Immediately trigger first sync
    add(const OperationSyncEvent.syncNow());

    // Schedule periodic syncs every 15 minutes for write data
    _syncTimer = Timer.periodic(const Duration(minutes: 15), (_) {
      add(const OperationSyncEvent.syncNow());
    });
  }

  Future<void> _onSyncNow(_SyncNow event, Emitter<OperationSyncState> emit) async {
    emit(const OperationSyncState.syncing());

    /// If online, sync all data
    /// Otherwise, get the last synced datetime and emit the state as [synced] if not manually triggered, else [failed]
    try {
      if (await _connection.isOnline) {
        await _syncService.syncQueuedWrites();

        await GetIt.I<AppDatabase>().syncMetadataDao.updateLastSyncedAt('writes');

        emit(OperationSyncState.synced(
          lastSyncedAt: DateTime.now(),
          now: DateTime.now(),
        ));
      } else {
        final lastSyncedAt = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('writes');

        if (event.manual) {
          emit(OperationSyncState.failure(
            message: 'No internet connection, failed to sync.',
            lastSyncedAt: lastSyncedAt,
            now: DateTime.now(),
          ));
        } else {
          emit(OperationSyncState.synced(
            lastSyncedAt: lastSyncedAt,
            now: DateTime.now(),
          ));
        }
      }
    } catch (e) {
      final lastSyncedAt = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('writes');
      emit(
        OperationSyncState.failure(
          message: e.toString(),
          lastSyncedAt: lastSyncedAt,
          now: DateTime.now(),
        ),
      );
    }
  }

  void _onTick(_Tick event, Emitter<OperationSyncState> emit) {
    state.maybeWhen(
      synced: (lastSyncedAt, _) => emit(
        OperationSyncState.synced(
          lastSyncedAt: lastSyncedAt,
          now: DateTime.now(),
        ),
      ),
      failure: (message, lastSyncedAt, _) => emit(
        OperationSyncState.failure(
          message: message,
          lastSyncedAt: lastSyncedAt,
          now: DateTime.now(),
        ),
      ),
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    _syncTimer?.cancel();
    _tickTimer?.cancel();
    return super.close();
  }
}
