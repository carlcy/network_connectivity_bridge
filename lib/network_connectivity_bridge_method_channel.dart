import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'network_connectivity_bridge_platform_interface.dart';

/// An implementation of [NetworkConnectivityBridgePlatform] that uses method channels.
class MethodChannelNetworkConnectivityBridge
    extends NetworkConnectivityBridgePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('network_connectivity_bridge');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
