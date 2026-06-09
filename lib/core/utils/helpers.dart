import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppHelpers {
  static void _afterFrame(VoidCallback action) {
    // Any overlay operation (snackbar/dialog) must run after the current build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      action();
    });
  }

  /// Show a success snackbar
  static void showSuccess(String message) {
    _afterFrame(() {
      Get.snackbar(
        'Success',
        message,
        backgroundColor: Colors.green.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        duration: const Duration(seconds: 3),
      );
    });
  }

  /// Show an error snackbar
  static void showError(String message) {
    _afterFrame(() {
      Get.snackbar(
        'Error',
        message,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        duration: const Duration(seconds: 4),
      );
    });
  }

  /// Show a loading dialog
  static void showLoading([String message = 'Loading...']) {
    _afterFrame(() {
      Get.dialog(
        Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 12),
                Text(
                  message,
                  // style: AppTextStyles.heading3.copyWith(
                  //   decoration: TextDecoration.none,
                  // ),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
      );
    });
  }

  /// Dismiss the loading dialog
  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  /// Convert Supabase exception to readable message
  static String parseError(dynamic error) {
    if (error is AuthException) return error.message;
    if (error is PostgrestException) return error.message;
    return error.toString();
  }
}
