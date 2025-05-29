package network_connectivity_bridge

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** NetworkConnectivityBridgePlugin */
class NetworkConnectivityBridgePlugin: FlutterPlugin {

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        // 这里可以注册 MethodChannel 监听等，如果你暂时没用原生代码，留空也没问题
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        // 资源释放
    }
}
