import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/pos/syncing/services/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/syncing/services/sync_service.dart';

part 'sync_event.dart';
part 'sync_state.dart';
part 'sync_bloc.freezed.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final SyncService _syncService;
  final ConnectivityService _connection;

  Timer? _syncTimer;
  Timer? _tickTimer;

  SyncBloc({required SyncService syncService, required ConnectivityService connection})
      : _syncService = syncService,
        _connection = connection,
        super(const SyncState.initial()) {
    on<_StartPeriodicSync>(_onStartPeriodicSync);
    on<_SyncNow>(_onSyncNow);
    on<_Tick>(_onTick);

    _tickTimer?.cancel();
    _tickTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      add(const SyncEvent.tick());
    });
  }

  Future<void> _onStartPeriodicSync(_StartPeriodicSync event, Emitter<SyncState> emit) async {
    // Cancel any existing timer
    _syncTimer?.cancel();

    // Immediately trigger first sync
    add(const SyncEvent.syncNow());

    // Schedule periodic syncs every 1 hour for read data
    _syncTimer = Timer.periodic(const Duration(minutes: 60), (_) {
      add(const SyncEvent.syncNow());
    });
  }

  Future<void> _onSyncNow(_SyncNow event, Emitter<SyncState> emit) async {
    emit(const SyncState.syncing());

    /// If online, sync all data
    /// Otherwise, get the last synced datetime and emit the state as [synced] if not manually triggered, else [failed]
    try {
      if (await _connection.isOnline) {
        // await _syncService.syncQueuedWrites();
        await _syncService.syncReadOnlyData();

        await GetIt.I<AppDatabase>().syncMetadataDao.updateLastSyncedAt('all');

        emit(SyncState.synced(
          lastSyncedAt: DateTime.now(),
          now: DateTime.now(),
        ));
      } else {
        final lastSyncedAt = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('all');

        if (event.manual) {
          emit(SyncState.failure(
            message: 'No internet connection, failed to sync.',
            lastSyncedAt: lastSyncedAt,
            now: DateTime.now(),
          ));
        } else {
          emit(SyncState.synced(
            lastSyncedAt: lastSyncedAt,
            now: DateTime.now(),
          ));
        }
      }
    } catch (e) {
      final lastSyncedAt = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('all');
      emit(
        SyncState.failure(
          message: e.toString(),
          lastSyncedAt: lastSyncedAt,
          now: DateTime.now(),
        ),
      );
    }
  }

  void _onTick(_Tick event, Emitter<SyncState> emit) {
    state.maybeWhen(
      synced: (lastSyncedAt, _) => emit(
        SyncState.synced(
          lastSyncedAt: lastSyncedAt,
          now: DateTime.now(),
        ),
      ),
      failure: (message, lastSyncedAt, _) => emit(
        SyncState.failure(
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
