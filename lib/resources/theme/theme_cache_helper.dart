import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  Future<void> cacheThemeIndex(bool isDarkMode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDarkMode", isDarkMode);
  }

  Future<bool> getCachedTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedThemeIndex = sharedPreferences.getBool("isDarkMode");
    if (cachedThemeIndex != null) {
      return cachedThemeIndex;
    } else {
      return false;
    }
  }
}
