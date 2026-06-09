import 'package:get/get.dart';

import '../../core/services/api_service.dart';
import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/auth/views/auth_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static String get initial {
    final api = Get.find<ApiService>();
    return api.currentSession != null ? Routes.MAIN : Routes.LOGIN;
  }

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
