import 'package:get/get.dart';

import '../../../core/models/api_response.dart';
import '../../../core/models/user_model.dart';
import '../../../core/services/api_service.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/helpers.dart';

class MainProvider {
  final _api = Get.find<ApiService>();

  Future<ApiResponse<UserModel>> userData() async {
    try {
      // Fetch user row from Supabase
      final userData = await _api
          .from(AppConstants.tableUsers)
          .select()
          .eq('id', _api.client.auth.currentUser!.id)
          .single();
      return ApiResponse.success(UserModel.fromJson(userData));
    } catch (e) {
      return ApiResponse.failure(AppHelpers.parseError(e));
    }
  }
}
