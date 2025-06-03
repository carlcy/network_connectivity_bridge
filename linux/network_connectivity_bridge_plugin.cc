#include "network_connectivity_bridge_plugin.h"

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>

#include <cstring>

#define NETWORK_CONNECTIVITY_BRIDGE_PLUGIN(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), network_connectivity_bridge_plugin_get_type(), \
                              NetworkConnectivityBridgePlugin))

struct _NetworkConnectivityBridgePlugin {
  GObject parent_instance;
};

G_DEFINE_TYPE(NetworkConnectivityBridgePlugin, network_connectivity_bridge_plugin, g_object_get_type())

// Called when a method call is received from Flutter.
static void network_connectivity_bridge_plugin_handle_method_call(
    NetworkConnectivityBridgePlugin* self,
    FlMethodCall* method_call) {
  // No native implementation needed as we're using connectivity_plus
  fl_method_call_respond_not_implemented(method_call);
}

static void network_connectivity_bridge_plugin_dispose(GObject* object) {
  G_OBJECT_CLASS(network_connectivity_bridge_plugin_parent_class)->dispose(object);
}

static void network_connectivity_bridge_plugin_class_init(NetworkConnectivityBridgePluginClass* klass) {
  G_OBJECT_CLASS(klass)->dispose = network_connectivity_bridge_plugin_dispose;
}

static void network_connectivity_bridge_plugin_init(NetworkConnectivityBridgePlugin* self) {}

void network_connectivity_bridge_plugin_register_with_registrar(FlPluginRegistrar* registrar) {
  NetworkConnectivityBridgePlugin* plugin = NETWORK_CONNECTIVITY_BRIDGE_PLUGIN(
      g_object_new(network_connectivity_bridge_plugin_get_type(), nullptr));

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlMethodChannel) channel =
      fl_method_channel_new(fl_plugin_registrar_get_messenger(registrar),
                          "network_connectivity_bridge",
                          FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(channel, (FlMethodCallHandler)network_connectivity_bridge_plugin_handle_method_call,
                                          g_object_ref(plugin),
                                          g_object_unref);

  g_object_unref(plugin);
} 