import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_connectivity_bridge/network_connectivity_bridge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkConnectivityBridge.instance.initialize(); // 初始化放这里

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectivity Bridge Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Network Connectivity Bridge')),
        body: ConnectivityStatusWidget(),
      ),
    );
  }
}

class ConnectivityStatusWidget extends StatefulWidget {
  @override
  State<ConnectivityStatusWidget> createState() =>
      _ConnectivityStatusWidgetState();
}

class _ConnectivityStatusWidgetState extends State<ConnectivityStatusWidget> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  String _status = 'Unknown';

  @override
  void initState() {
    super.initState();
    _subscription = NetworkConnectivityBridge.instance.onConnectivityChanged
        .listen((results) {
      setState(() {
        if (results.contains(ConnectivityResult.wifi)) {
          _status = 'Connected via WiFi';
        } else if (results.contains(ConnectivityResult.mobile)) {
          _status = 'Connected via Mobile Data';
        } else {
          _status = 'No Internet Connection';
        }
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Network Status: $_status'));
  }
}
