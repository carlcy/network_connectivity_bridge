import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_connectivity_bridge/network_connectivity_bridge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkConnectivityBridge.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectivity Bridge Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ConnectivityStatusWidget(),
    );
  }
}

class ConnectivityStatusWidget extends StatefulWidget {
  const ConnectivityStatusWidget({super.key});

  @override
  State<ConnectivityStatusWidget> createState() => _ConnectivityStatusWidgetState();
}

class _ConnectivityStatusWidgetState extends State<ConnectivityStatusWidget> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  String _status = 'Unknown';

  @override
  void initState() {
    super.initState();
    _updateStatus(NetworkConnectivityBridge.instance.currentStatus);
    _subscription = NetworkConnectivityBridge.instance.onConnectivityChanged
        .listen(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult>? results) {
    if (results == null) return;
    setState(() {
      if (results.contains(ConnectivityResult.wifi)) {
        _status = 'Connected via WiFi';
      } else if (results.contains(ConnectivityResult.mobile)) {
        _status = 'Connected via Mobile Data';
      } else {
        _status = 'No Internet Connection';
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Connectivity Bridge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _status.contains('Connected') ? Icons.wifi : Icons.wifi_off,
              size: 64,
              color: _status.contains('Connected') ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              _status,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
