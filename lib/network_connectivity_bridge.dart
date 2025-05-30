library network_connectivity_bridge;

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

/// A singleton bridge around connectivity_plus to provide
/// global access to connectivity status and allow multiple listeners
/// to subscribe without conflict.
class NetworkConnectivityBridge {
  NetworkConnectivityBridge._internal();

  static final NetworkConnectivityBridge instance =
      NetworkConnectivityBridge._internal();

  final Connectivity _connectivity = Connectivity();

  final StreamController<List<ConnectivityResult>> _controller =
      StreamController<List<ConnectivityResult>>.broadcast();

  bool _initialized = false;

  List<ConnectivityResult>? _lastKnownResult;

  /// Initialize connectivity bridge. Should be called once at app startup.
  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    final initResult = await _connectivity.checkConnectivity();
    _lastKnownResult = initResult;
    _controller.add(_lastKnownResult!);

    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _lastKnownResult = result;
      _controller.add(result);
    });
  }

  List<ConnectivityResult>? get currentStatus => _lastKnownResult;

  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _controller.stream;
}
