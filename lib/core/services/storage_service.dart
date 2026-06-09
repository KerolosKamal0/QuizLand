import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late SharedPreferences _prefs;

  /// Called manually from InitialBinding.initAsync().
  /// Do NOT rely on onInit() for async setup — it is not awaited by GetX.
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  T? read<T>(String key) {
    return _prefs.get(key) as T?;
  }

  Future<bool> write<T>(String key, T value) async {
    if (value is String) return _prefs.setString(key, value);
    if (value is int) return _prefs.setInt(key, value);
    if (value is bool) return _prefs.setBool(key, value);
    if (value is double) return _prefs.setDouble(key, value);
    return false;
  }

  Future<bool> remove(String key) => _prefs.remove(key);

  Future<bool> clear() => _prefs.clear();

  bool hasKey(String key) => _prefs.containsKey(key);
}
