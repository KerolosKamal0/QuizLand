import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/models/user_model.dart';
import '../../../core/utils/helpers.dart';
import '../models/login_request.dart';
import '../providers/auth_provider.dart';

class AuthController extends GetxController {
  final _provider = AuthProvider();

  final _isLogin = true.obs;
  bool get isLogin => _isLogin.value;

  final Rx<UserRole> _role = UserRole.student.obs;
  UserRole get role => _role.value;

  // ── Fields Controllers ──────────────────────────────────────────
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ── State ───────────────────────────────────────────────────────
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void setLoginMode(bool login) {
    if (isLogin == login) return;
    _isLogin.value = login;
    // errorMessage = null;
  }

  void setRole(UserRole value) {
    _role.value = value;
  }

  // ── Login ─────────────────────────────────────────────────────
  Future<void> login() async {
    // if (!loginFormKey.currentState!.validate()) return;

    _isLoading.value = true;
    final result = await _provider.login(
      LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );
    _isLoading.value = false;

    if (result.success) {
      Get.offAllNamed(Routes.MAIN);
    } else {
      AppHelpers.showError(result.error ?? 'Login failed');
    }
  }

  // ── Register ──────────────────────────────────────────────────
  Future<void> register() async {
    //   if (!registerFormKey.currentState!.validate()) return;

    //   _isLoading.value = true;
    //   final result = await _provider.register(
    //     RegisterRequest(
    //       email: emailController.text.trim(),
    //       password: passwordController.text,
    //       fullName: nameController.text.trim(),
    //     ),
    //   );
    //   _isLoading.value = false;

    //   if (result.success) {
    //     _user.value = result.data;
    //     AppHelpers.showSuccess('Account created! Please verify your email.');
    //     Get.offAllNamed(Routes.HOME);
    //   } else {
    //     AppHelpers.showError(result.error ?? 'Registration failed');
    //   }
  }
}
