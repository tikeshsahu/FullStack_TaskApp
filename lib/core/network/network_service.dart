import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool _isConnected = true.obs;

  bool get isConnected => _isConnected.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } catch (e) {
      _isConnected.value = false;
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    _isConnected.value = results.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet,
    );
  }

  Future<bool> checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
      return _isConnected.value;
    } catch (e) {
      _isConnected.value = false;
      return false;
    }
  }
}
