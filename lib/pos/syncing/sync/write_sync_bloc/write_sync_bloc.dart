import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/sync_service.dart';

part 'write_sync_event.dart';
part 'write_sync_state.dart';
part 'write_sync_bloc.freezed.dart';

class WriteSyncBloc extends Bloc<WriteSyncEvent, WriteSyncState> {
  final SyncService _syncService;
  final ConnectivityService _connection;

  Timer? _syncTimer;
  Timer? _tickTimer;

  WriteSyncBloc({required SyncService syncService, required ConnectivityService connection})
      : _syncService = syncService,
        _connection = connection,
        super(const WriteSyncState.initial()) {
    on<_StartPeriodicSync>(_onStartPeriodicSync);
    on<_SyncNow>(_onSyncNow);
    on<_Tick>(_onTick);

    _tickTimer?.cancel();
    _tickTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      add(const WriteSyncEvent.tick());
    });
  }

  Future<void> _onStartPeriodicSync(_StartPeriodicSync event, Emitter<WriteSyncState> emit) async {
    // Cancel any existing timer
    _syncTimer?.cancel();

    // Immediately trigger first sync
    add(const WriteSyncEvent.syncNow());

    // Schedule periodic syncs every 15 minutes for write data
    _syncTimer = Timer.periodic(const Duration(minutes: 15), (_) {
      add(const WriteSyncEvent.syncNow());
    });
  }

  Future<void> _onSyncNow(_SyncNow event, Emitter<WriteSyncState> emit) async {
    emit(const WriteSyncState.syncing());

    /// If online, sync all data
    /// Otherwise, get the last synced datetime and emit the state as [synced] if not manually triggered, else [failed]
    try {
      if (await _connection.isOnline) {
        await _syncService.syncQueuedWrites();

        await GetIt.I<AppDatabase>().syncMetadataDao.updateLastSyncedAt('writes');

        emit(WriteSyncState.synced(
          lastSyncedAt: DateTime.now(),
          now: DateTime.now(),
        ));
      } else {
        final lastSyncedAt = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('writes');

        if (event.manual) {
          emit(WriteSyncState.failure(
            message: 'No internet connection, failed to sync.',
            lastSyncedAt: lastSyncedAt,
            now: DateTime.now(),
          ));
        } else {
          emit(WriteSyncState.synced(
            lastSyncedAt: lastSyncedAt,
            now: DateTime.now(),
          ));
        }
      }
    } catch (e) {
      final lastSyncedAt = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('writes');
      emit(
        WriteSyncState.failure(
          message: e.toString(),
          lastSyncedAt: lastSyncedAt,
          now: DateTime.now(),
        ),
      );
    }
  }

  void _onTick(_Tick event, Emitter<WriteSyncState> emit) {
    state.maybeWhen(
      synced: (lastSyncedAt, _) => emit(
        WriteSyncState.synced(
          lastSyncedAt: lastSyncedAt,
          now: DateTime.now(),
        ),
      ),
      failure: (message, lastSyncedAt, _) => emit(
        WriteSyncState.failure(
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
