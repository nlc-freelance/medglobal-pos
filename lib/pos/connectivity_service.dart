import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService {
  // static final ConnectivityService _instance = ConnectivityService._internal();
  // factory ConnectivityService() => _instance;
  // ConnectivityService._internal() {
  //   _initConnectivityListener();
  // }

  ConnectivityService() {
    _initConnectivityListener();
  }

  final _controller = StreamController<bool>.broadcast();

  Stream<bool> get onConnectionChanged => _controller.stream;

  late StreamSubscription<InternetConnectionStatus> _subscription;

  void _initConnectivityListener() {
    try {
      _subscription = InternetConnectionChecker.instance.onStatusChange.listen((InternetConnectionStatus status) {
        final isConnected = status == InternetConnectionStatus.connected;
        _controller.add(isConnected);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> get isOnline async {
    return await InternetConnectionChecker.instance.hasConnection;
  }

  void dispose() {
    _subscription.cancel();
    _controller.close;
  }
}
