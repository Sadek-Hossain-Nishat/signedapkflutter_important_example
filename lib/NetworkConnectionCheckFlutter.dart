import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(List<String> args) {
  runApp(NetworkConnectionCheckFlutter());
}

class NetworkConnectionCheckFlutter extends StatelessWidget {
  const NetworkConnectionCheckFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepagefornetworkconnectioncheck(),
    );
  }
}

class Homepagefornetworkconnectioncheck extends StatefulWidget {
  const Homepagefornetworkconnectioncheck({Key? key}) : super(key: key);

  @override
  State<Homepagefornetworkconnectioncheck> createState() =>
      _HomepagefornetworkconnectioncheckState();
}

class _HomepagefornetworkconnectioncheckState
    extends State<Homepagefornetworkconnectioncheck> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Network Conncetion Check'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              checkConnection();
            },
            child: Text('Check Connection')),
      ),
    ));
  }

  void checkConnection() async {
    _connectionStatus = await (_connectivity.checkConnectivity());
    if (_connectionStatus == ConnectivityResult.mobile) {
      Fluttertoast.showToast(msg: 'Connected with mobile data');
      // I am connected to a mobile network.
    } else if (_connectionStatus == ConnectivityResult.wifi) {
      Fluttertoast.showToast(msg: 'Connected with wifi');
      // I am connected to a wifi network.
    } else {
      Fluttertoast.showToast(msg: 'No internet');
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      Fluttertoast.showToast(msg: _connectionStatus.name);
    });
  }
}
