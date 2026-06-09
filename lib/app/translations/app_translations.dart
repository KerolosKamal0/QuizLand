import 'package:get/get.dart';
import 'en_us_strings.dart';
import 'ar_ar_strings.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'ar_AR': arAR};
}
