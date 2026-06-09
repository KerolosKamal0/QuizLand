import 'dart:ui';
import 'package:get/get.dart';

import '../../core/services/storage_service.dart';
import '../../core/utils/constants.dart';

class LocaleController extends GetxController {
  final _storage = Get.find<StorageService>();

  final _locale = const Locale('en', 'US').obs;
  // final _locale = const Locale('ar', 'EG').obs;
  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    final saved = _storage.read<String>(AppConstants.keyLocale);
    if (saved != null) {
      final parts = saved.split('_');
      _locale.value = Locale(parts[0], parts[1]);
    }
  }

  void changeLocale(String languageCode, String countryCode) {
    final newLocale = Locale(languageCode, countryCode);
    _locale.value = newLocale;
    _storage.write(AppConstants.keyLocale, '${languageCode}_$countryCode');
    Get.updateLocale(newLocale);
  }
}
