import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static  SharedPreferences ?sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }

  static double? getDataDouble({
    required String key,
  })  {

    return  sharedPreferences!.getDouble(key);
  }
  static String? getDataString({
    required String key,
  })  {
     return  sharedPreferences!.getString(key);

  }
  static Future<int?>getDataInt({
    required String key,
  }) async {
    return  sharedPreferences!.getInt(key);

  }
  static bool? getBoolean({
    required String key,
  })
  {
    return sharedPreferences!.getBool(key);
  }
}



