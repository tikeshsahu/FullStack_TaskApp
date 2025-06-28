import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  late final AuthRepository _authRepository;

  AuthController() {
    _authRepository = AuthRepositoryImpl();
  }

  final RxBool _isLoading = RxBool(false);
  final RxBool _isSignUp = RxBool(false);
  final Rx<TextEditingController> _emailController = Rx(
    TextEditingController(),
  );
  final Rx<TextEditingController> _passwordController = Rx(
    TextEditingController(),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isLoading => _isLoading.value;
  bool get isSignUp => _isSignUp.value;
  TextEditingController get emailController => _emailController.value;
  TextEditingController get passwordController => _passwordController.value;

  void toggleAuthMode() {
    _isSignUp.value = !_isSignUp.value;
    update();
  }

  void updateIsLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    print('inside validatePassword');
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> handleSubmit() async {
    if (!formKey.currentState!.validate()) return;

    try {
      updateIsLoading(true);

      if (isSignUp) {
        await _authRepository.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      } else {
        await _authRepository.signInWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }

      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      updateIsLoading(false);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
