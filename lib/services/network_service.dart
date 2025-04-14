import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkService {
  static final Connectivity _connectivity = Connectivity();

  static Future<List<ConnectivityResult>> getConnectivityStatus() async {
    return await _connectivity.checkConnectivity();
  }

  static Future<bool> get isConnected async {
    final List<ConnectivityResult> result = await getConnectivityStatus();
    final isConnected = !result.contains(ConnectivityResult.none);
    return isConnected;
  }

  static Stream<List<ConnectivityResult>> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged;
  }
}
