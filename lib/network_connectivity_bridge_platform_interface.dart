import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'network_connectivity_bridge_method_channel.dart';

abstract class NetworkConnectivityBridgePlatform extends PlatformInterface {
  /// Constructs a NetworkConnectivityBridgePlatform.
  NetworkConnectivityBridgePlatform() : super(token: _token);

  static final Object _token = Object();

  static NetworkConnectivityBridgePlatform _instance =
      MethodChannelNetworkConnectivityBridge();

  /// The default instance of [NetworkConnectivityBridgePlatform] to use.
  ///
  /// Defaults to [MethodChannelNetworkConnectivityBridge].
  static NetworkConnectivityBridgePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NetworkConnectivityBridgePlatform] when
  /// they register themselves.
  static set instance(NetworkConnectivityBridgePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
