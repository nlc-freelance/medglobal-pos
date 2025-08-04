import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  late StreamSubscription<InternetConnectionStatus> _subscription;

  /// Public stream to expose network status updates
  final StreamController<bool> _connectionChangeController = StreamController<bool>.broadcast();
  Stream<bool> get onConnectionChanged => _connectionChangeController.stream;

  /// Initialize the service and start listening
  void initialize() {
    _subscription = InternetConnectionChecker.instance.onStatusChange.listen((status) {
      final isConnected = status == InternetConnectionStatus.connected;
      _connectionChangeController.add(isConnected);
    });
  }

  /// Check current connection status manually
  Future<bool> hasConnection() async {
    return await InternetConnectionChecker.instance.hasConnection;
  }

  /// Dispose resources when no longer needed
  void dispose() {
    _subscription.cancel();
    _connectionChangeController.close();
  }
  // final InternetConnectionChecker _internetChecker;

  // final StreamController<bool> _controller = StreamController.broadcast();
  // bool _lastStatus = false;

  // NetworkService({InternetConnectionChecker? checker})
  //    :   _internetChecker = checker ?? InternetConnectionChecker.instance;

  // void initialize() {
  //   _internetChecker.onStatusChange.listen((status) {
  //    _evaluateConnection();
  //   });
  // }

  // Future<void> _evaluateConnection() async {
  //   final hasInternetConnection = await _internetChecker.hasConnection;


  //   bool hasInternet = hasInternetConnection;

  //   // Only emit when the status changes to avoid flooding listeners.
  //   if (hasInternet != _lastStatus) {
  //     _lastStatus = hasInternet;
  //     _controller.add(hasInternet);
  //   }
  // }

  // Stream<bool> get onStatusChange => _controller.stream;
  // Future<bool> get hasInternet async => _lastStatus;

  // void dispose() {
  //   _controller.close();
  // }
}
