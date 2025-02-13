import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendytracking/data/models/user_model.dart';

mixin AddUserRemote {
  Future<void> addUserToFirestore(UserModel user);
}

mixin CheckUserStillInFireStore {
  Future<bool> isUserInFireStore(String id);
}
mixin GetUserFromFireStore {
  UserModel? getUserFromFirestore();
}
mixin ManagementUserLocalSharePref {
  Future<void> addUserLocal(String id);
  Future<String?> getIdUserLocal();
  Future<int?> getIntIdUserLocal();
  Future<void> setIntIdUserLocal(int id);
}

mixin ManagementUserLocalSqflite {
  Future<void> createTableUser();
  Future<int> insertUserSqflite(UserModel user);
  Future<UserModel?> getUserFromSqflite(int id);
}

abstract class AuthRepository
    with
        AddUserRemote,
        ManagementUserLocalSharePref,
        CheckUserStillInFireStore,
        GetUserFromFireStore,ManagementUserLocalSqflite {
  Future<GoogleSignInAuthentication?> login();
  Future<User?> getUserFromGoogleAuth(GoogleSignInAuthentication? auth);
  Future logout();
}
