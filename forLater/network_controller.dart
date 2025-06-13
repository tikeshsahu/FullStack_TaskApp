


// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';

// class NetworkController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _subscription;
//   final RxBool _isConnected = false.obs;

//   bool get isConnected => _isConnected.value;

//   @override
//   void onInit() {
//     super.onInit();
//     _subscription =
//         _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
//   }

//   void updateConnectionStatus(ConnectivityResult connectivityResult) {
//     final bool currentStatus = connectivityResult != ConnectivityResult.none;

//     if (_isConnected.value != currentStatus) {
//       _isConnected.value = currentStatus;

//       if (_isConnected.value) {
//         if (kDebugMode) print('Network Connected');
//         // if (Get.isRegistered<SessionController>()) {
//         //   Get.find<SessionController>().onInit();
//         // }
//         // Handle reconnection logic here if needed
//       } else {
//         if (kDebugMode) print('Network Disconnected');
//       }
//     }
//   }

//   @override
//   void onClose() {
//     _subscription.cancel();
//     super.onClose();
//   }
// }