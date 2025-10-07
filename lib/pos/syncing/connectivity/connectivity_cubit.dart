import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_service.dart';

class ConnectivityCubit extends Cubit<bool> {
  final ConnectivityService _service;

  late StreamSubscription _subscription;

  ConnectivityCubit({required ConnectivityService service})
      : _service = service,
        super(true);

  void monitorConnection() {
    // Emit initial state
    _service.isOnline.then((result) {
      emit(result);
    });

    _subscription = _service.onConnectionChanged.listen((isConnected) {
      emit(isConnected);
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
