import 'package:get/get.dart';

import '../../core/services/api_service.dart';
import '../../core/services/storage_service.dart';
import '../themes/theme_controller.dart';
import '../translations/locale_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {}

  Future<void> initAsync() async {
    await Get.putAsync<StorageService>(() async {
      final service = StorageService();
      await service.init();
      return service;
    }, permanent: true);

    Get.put<ApiService>(ApiService(), permanent: true);

    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<LocaleController>(LocaleController(), permanent: true);
  }
}
