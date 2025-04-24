import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/services/network_service.dart';
import 'package:dogapp/tools/extensions.dart';
import 'package:flutter/material.dart';

class NetworkAwareWidget extends StatefulWidget {
  const NetworkAwareWidget({
    super.key,
    required this.child,
    required this.onInternetConnected,
  });

  final Widget child;
  final void Function() onInternetConnected;

  @override
  NetworkAwareWidgetState createState() => NetworkAwareWidgetState();
}

class NetworkAwareWidgetState extends State<NetworkAwareWidget> {
  StreamSubscription<List<ConnectivityResult>>? _streamSubscription;
  bool _isConnected = false;
  bool? _isConnectedPrev;

  @override
  void initState() {
    super.initState();
    _checkConnectivityOnce();
    _streamSubscription = NetworkService.onConnectivityChanged.listen(connectivityListener);
  }

  void connectivityListener(List<ConnectivityResult> result) {
    final currentConnectionStatus = result.isConnected;
    setState(
      () {
        _isConnected = currentConnectionStatus;
        if (_isConnectedPrev == false && currentConnectionStatus == true) {
          widget.onInternetConnected.call();
        }
        _isConnectedPrev = currentConnectionStatus;
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  Future<void> _checkConnectivityOnce() async {
    final isConnected = await NetworkService.isConnected;
    setState(() {
      _isConnected = isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        widget.child,
        if (!_isConnected)
          Container(
            color: Colors.black87,
            alignment: Alignment.center,
            // margin: const EdgeInsets.only(top: 88),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(44),
              decoration: AppDeco.mainDeco,
              child: Text(
                context.tt.noInternetMessage,
                textAlign: TextAlign.center,
                style: AppTypo.body1,
              ),
            ),
          ),
      ],
    );
  }
}
