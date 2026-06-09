import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'themes/app_theme.dart';
import 'themes/theme_controller.dart';
import 'translations/app_translations.dart';
import 'translations/locale_controller.dart';

class QuizLandApp extends StatelessWidget {
  const QuizLandApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final localeCtrl = Get.find<LocaleController>();

    return Obx(
      () => GetMaterialApp(
        title: 'QuizLand',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: themeCtrl.themeMode,
        getPages: AppPages.routes,
        initialRoute: AppPages.initial,
        locale: localeCtrl.locale,
        translations: AppTranslations(),
        fallbackLocale: const Locale('en', 'US'),
      ),
    );
  }
}
