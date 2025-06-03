//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <network_connectivity_bridge/network_connectivity_bridge_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) network_connectivity_bridge_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NetworkConnectivityBridgePlugin");
  network_connectivity_bridge_plugin_register_with_registrar(network_connectivity_bridge_registrar);
}
