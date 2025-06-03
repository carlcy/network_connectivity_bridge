#ifndef NETWORK_CONNECTIVITY_BRIDGE_PLUGIN_H_
#define NETWORK_CONNECTIVITY_BRIDGE_PLUGIN_H_

#include <flutter/method-channel.h>
#include <flutter/plugin-registrar.h>

class NetworkConnectivityBridgePlugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrar* registrar);
};

#endif  // NETWORK_CONNECTIVITY_BRIDGE_PLUGIN_H_ 