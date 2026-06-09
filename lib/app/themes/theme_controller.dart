import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/storage_service.dart';
import '../../core/utils/constants.dart';

class ThemeController extends GetxController {
  final _storage = Get.find<StorageService>();

  final _isDark = false.obs;
  bool get isDark => _isDark.value;

  ThemeMode get themeMode => _isDark.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    _isDark.value = _storage.read<bool>(AppConstants.keyThemeDark) ?? false;
  }

  void toggleTheme() {
    _isDark.value = !_isDark.value;
    _storage.write(AppConstants.keyThemeDark, _isDark.value);
    Get.changeThemeMode(themeMode);
  }

  void setDark(bool value) {
    _isDark.value = value;
    _storage.write(AppConstants.keyThemeDark, value);
    Get.changeThemeMode(themeMode);
  }
}
