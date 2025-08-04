import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medglobal_admin_portal/pos/connectivity_service.dart';

class ConnectivityCubit extends Cubit<bool> {
  final ConnectivityService _service;
  late StreamSubscription _subscription;

  ConnectivityCubit({required ConnectivityService service})
      : _service = service,
        super(true);

  void monitorConnection() {
    _subscription = _service.onConnectionChanged.listen((isConnected) {
      print('hey');
      print(isConnected);
      emit(isConnected);
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
