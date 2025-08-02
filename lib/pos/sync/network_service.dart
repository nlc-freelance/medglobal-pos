import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  final Connectivity _connectivity;
  final InternetConnectionChecker _internetChecker;

  final StreamController<bool> _controller = StreamController.broadcast();
  bool _lastStatus = false;

  NetworkService({Connectivity? conn, InternetConnectionChecker? checker})
      : _connectivity = conn ?? Connectivity(),
        _internetChecker = checker ?? InternetConnectionChecker.instance;

  void initialize() {
    _connectivity.onConnectivityChanged.listen((result) async {
      await _evaluateConnection();
    });
    // Evaluate once at startup
    _evaluateConnection();
  }

  Future<void> _evaluateConnection() async {
    final networks = await _connectivity.checkConnectivity();
    final hasInternetConnection = await _internetChecker.hasConnection;

    bool hasInternet = (networks.first != ConnectivityResult.none && hasInternetConnection);

    // Only emit when the status changes to avoid flooding listeners.
    if (hasInternet != _lastStatus) {
      _lastStatus = hasInternet;
      _controller.add(hasInternet);
    }
  }

  Stream<bool> get onStatusChange => _controller.stream;
  Future<bool> get hasInternet async => _lastStatus;

  void dispose() {
    _controller.close();
  }
}
