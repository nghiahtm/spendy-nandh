import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendytracking/data/models/user_model.dart';

mixin AddUserRemote {
  Future<void> addUser(UserModel user);
}

mixin CheckUserStillInFireStore {
  Future<bool> isUserInFireStore(String id);
}
mixin GetUserFromFireStore {
  UserModel? getUserFromFirestore();
}
mixin ManagementUserLocal {
  Future<void> addUserLocal(String id);
  Future<String?> getIdUserLocal();
}

abstract class AuthRepository
    with AddUserRemote, ManagementUserLocal, CheckUserStillInFireStore,GetUserFromFireStore {
  Future<GoogleSignInAuthentication?> login();
  Future<User?> getUserFromGoogleAuth(GoogleSignInAuthentication? auth);
  Future logout();
}
