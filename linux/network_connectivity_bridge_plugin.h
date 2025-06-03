#ifndef NETWORK_CONNECTIVITY_BRIDGE_PLUGIN_H_
#define NETWORK_CONNECTIVITY_BRIDGE_PLUGIN_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

typedef struct _NetworkConnectivityBridgePlugin NetworkConnectivityBridgePlugin;
typedef struct {
  GObjectClass parent_class;
} NetworkConnectivityBridgePluginClass;

FLUTTER_PLUGIN_EXPORT GType network_connectivity_bridge_plugin_get_type();

FLUTTER_PLUGIN_EXPORT void network_connectivity_bridge_plugin_register_with_registrar(
    FlPluginRegistrar* registrar);

G_END_DECLS

#endif  // NETWORK_CONNECTIVITY_BRIDGE_PLUGIN_H_ 