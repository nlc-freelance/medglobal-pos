// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:medglobal_admin_portal/pos/sync/network_service.dart';
// import 'package:medglobal_admin_portal/pos/sync/sync_service.dart';
//
// part 'sync_event.dart';
// part 'sync_state.dart';
// part 'sync_bloc.freezed.dart';
//
// class SyncBloc extends Bloc<SyncEvent, SyncState> {
//   final SyncService _syncService;
//   final NetworkService _networkService;
//
//   SyncBloc({
//     required SyncService syncService,
//     required NetworkService networkService,
//   })  : _syncService = syncService,
//         _networkService = networkService,
//         super(const SyncState.initial()) {
//     on<_Start>(_onStart);
//     on<_Stop>(_onStop);
//     on<_Manual>(_onTriggerSync);
//   }
//
//   StreamSubscription<bool>? _connectivitySubscription;
//   Timer? _periodicTimer;
//
//   void _onStart(_Start event, Emitter<SyncState> emit) {
//     try {
//       // Start connectivity listener
//       _connectivitySubscription ??= _networkService.onConnectionChanged.listen((isOnline) {
//         if (isOnline) _syncService.sync();
//       });
//
//       // Start 10-minute periodic sync
//       _periodicTimer ??= Timer.periodic(const Duration(minutes: 10), (_) async {
//         if (await _networkService.hasConnection()) {
//           _syncService.sync();
//         }
//       });
//
//       emit(_syncService.isSyncing ? const SyncState.syncing() : const SyncState.success());
//     } catch (e) {
//       emit(SyncState.failure(e.toString()));
//     }
//   }
//
//   void _onStop(_Stop event, Emitter<SyncState> emit) {
//     _connectivitySubscription?.cancel();
//     _connectivitySubscription = null;
//
//     _periodicTimer?.cancel();
//     _periodicTimer = null;
//     emit(const SyncState.initial());
//   }
//
//   Future<void> _onTriggerSync(_Manual event, Emitter<SyncState> emit) async {
//     emit(const SyncState.syncing());
//
//     try {
//       await _syncService.sync();
//       emit(const SyncState.success());
//     } catch (e) {
//       emit(SyncState.failure(e.toString()));
//     }
//   }
// }
