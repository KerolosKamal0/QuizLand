import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/models/api_response.dart';
import '../../../core/services/api_service.dart';
import '../../../core/utils/helpers.dart';
import '../models/login_request.dart';

class AuthProvider {
  final _api = Get.find<ApiService>();

  Future<ApiResponse<User>> login(LoginRequest request) async {
    try {
      final response = await _api.signInWithEmail(
        request.email,
        request.password,
      );

      if (response.user == null) {
        return ApiResponse.failure('Login failed. Please try again.');
      }

      return ApiResponse.success(response.user!);
    } catch (e) {
      return ApiResponse.failure(AppHelpers.parseError(e));
    }
  }
}
