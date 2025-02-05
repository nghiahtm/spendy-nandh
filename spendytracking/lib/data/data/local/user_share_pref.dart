import 'package:spendytracking/core/helpers/local/shared_pref_helper.dart';

class UserSharePref {
  final SharedPrefHelper sharedPrefHelper;

  UserSharePref({required this.sharedPrefHelper});

  Future<void> setUserLocal(String idUser) {
    return sharedPrefHelper.setStringUser(idUser);
  }

  Future<String?> getUserLocal() {
    return sharedPrefHelper.readStringUser();
  }
}
