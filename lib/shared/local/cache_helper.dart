import 'package:flutter_news_app/shared/components/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late  SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences=await SharedPreferences.getInstance();
  }

  static Future<bool> setThemeMode({
    required bool isDark
  }) async {
    return await sharedPreferences.setBool(IS_DARK, isDark);
  }

  static bool getThemeMode()  {
    return  sharedPreferences.getBool(IS_DARK)??false;
  }

}