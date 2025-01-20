import 'package:shared_preferences/shared_preferences.dart';

class KeySharedPrefHelperConstant{
  static const kUser = "key_user";
}
class SharedPrefHelper {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<String?> readStringUser() async {
    return asyncPrefs.getString(KeySharedPrefHelperConstant.kUser);
  }

  Future<void> setStringUser(String value) async {
    asyncPrefs.setString(KeySharedPrefHelperConstant.kUser,value);
  }
}
