import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkService {
  static final Connectivity _connectivity = Connectivity();

  static Future<List<ConnectivityResult>> getConnectivityStatus() async {
    return await _connectivity.checkConnectivity();
  }

  static Future<bool> get isConnected async {
    final List<ConnectivityResult> result = await getConnectivityStatus();
    return result.isConnected;
  }

  static Stream<List<ConnectivityResult>> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged;
  }
}

extension ConnectivityResultExtension on List<ConnectivityResult> {
  bool get isConnected => !contains(ConnectivityResult.none);
  bool get notConnected => contains(ConnectivityResult.none);
}
