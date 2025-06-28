// // ignore_for_file: deprecated_member_use, depend_on_referenced_packages
// import 'dart:developer';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:preplaced_mentor/routes/app_routes.dart';
// import 'package:preplaced_mentor/services/analytics_service.dart';
// import 'package:preplaced_mentor/services/common_service.dart';
// import 'package:preplaced_mentor/services/storage_service.dart';
// import 'package:preplaced_mentor/utils/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../common/snack_bar.dart';
// import '../../utils/app_keys.dart';

// class AuthController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final _googleSignIn = GoogleSignIn();
//   final Rx _emailController = Rx(TextEditingController());
//   final RxBool _isLoading = RxBool(false);
//   final formKey = GlobalKey<FormState>();
//   final RxBool _dynamicLinkAuthLoading = RxBool(false);
//   final RxBool _dynamicLinkEmailSent = RxBool(false);
//   final analytics = AnalyticsService.instance;

//   FirebaseAuth get auth => _auth;
//   TextEditingController get emailController => _emailController.value;
//   bool get isLoading => _isLoading.value;
//   GlobalKey<FormState> get getKey => formKey;
//   bool get dynamicLinkAuthLoading => _dynamicLinkAuthLoading.value;
//   bool get dynamicLinkEmailSent => _dynamicLinkEmailSent.value;


//   updateIsLoading(bool value) {
//     _isLoading.value = value;
//     update();
//   }

//   updateDynamicLinkAuthLoading(bool value) {
//     _dynamicLinkAuthLoading.value = value;
//     update();
//   }

//   updateDynamicLinkEmailSent(bool value) {
//     _dynamicLinkEmailSent.value = value;
//     update();
//   }

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }

//   signInWithGoogle() async {
//     try {
//       updateIsLoading(true);
//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser != null) {
//         // Obtain the auth details from the request
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;

//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         // Once signed in, return the UserCredential
//         return await FirebaseAuth.instance
//             .signInWithCredential(credential)
//             .then((value) {
//           StorageService.instance.save(AppConstants.userUID, value.user!.uid);
//           StorageService.instance
//               .save(AppConstants.userEmail, value.user!.email);
//           AnalyticsService.instance
//               .logEvent('LoggedIn using Google login', 'Auth Screen');
//           Get.offAllNamed(AppRoutes.layoutRoute);
//         });
//       }
//     } on PlatformException catch (e) {
//       if (kDebugMode) log(e.code.toString());
//       // if (e.code == 'network_error') {
//       //   showNoInternet();
//       // }
//     } on SocketException catch (e) {
//       if (kDebugMode) log(e.toString());
//       showNoInternet();
//     } finally {
//       updateIsLoading(false);
//     }
//   }

//   Future<User?> signInApple() async {
//     try {
//       updateIsLoading(true);
//       final appleProvider = AppleAuthProvider();
//       appleProvider.addScope('email');
//       appleProvider.addScope('name');

//       // Start the Apple sign-in flow
//       await FirebaseAuth.instance
//           .signInWithProvider(appleProvider)
//           .then((value) async {
//         final firebaseUser = value.user;

//         if (firebaseUser != null) {
//           final displayName = '${firebaseUser.displayName}';
//           final userEmail = '${firebaseUser.email}';

//           await firebaseUser.updateProfile(displayName: displayName);
//           await firebaseUser.updateEmail(userEmail);
//         }

//         StorageService.instance.save(AppConstants.userUID, value.user!.uid);
//         StorageService.instance.save(AppConstants.userEmail, value.user!.email);
//         AnalyticsService.instance
//             .logEvent('LoggedIn using Apple login', 'Auth Screen');
//         Get.offAllNamed(AppRoutes.layoutRoute);
//       });
//     } on FirebaseAuthException catch (e) {
//       if (kDebugMode) {
//         print('FirebaseAuthException: ${e.message}');
//       }
//       updateIsLoading(false);
//     } on SocketException catch (e) {
//       showNoInternet();
//       if (kDebugMode) {
//         print('SocketException: ${e.message}');
//       }
//       updateIsLoading(false);
//     } catch (e) {
//       updateIsLoading(false);
//     }
//     return null;
//   }

//   signinUsingEmailAndPassword() async {
//     updateIsLoading(true);
//     if (!formKey.currentState!.validate()) {
//       updateIsLoading(true);
//       return;
//     }
//     try {
//       updateIsLoading(true);
//       return await _auth
//           .signInWithEmailAndPassword(
//               email: emailController.text, password: 'Dev@preplaced2024')
//           .then((value) {
//         StorageService.instance.save(AppConstants.userUID, value.user!.uid);
//         StorageService.instance
//             .save(AppConstants.userEmail, emailController.text);
//         Get.offAllNamed(AppRoutes.layoutRoute);
//       });
//       // return await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
//     } on FirebaseAuthException catch (e) {
//       log(e.toString());
//     } catch (e) {
//       log(e.toString());
//     } finally {
//       updateIsLoading(false);
//     }
//   }
// }