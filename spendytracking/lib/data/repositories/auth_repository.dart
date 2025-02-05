import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendytracking/data/models/user_model.dart';


mixin AddUser {
  Future<void> addUser(UserModel user);
}

mixin ManagementUserLocal{
  Future<void> addUserLocal(String id);
  Future<String?> getIdUserLocal();
}

abstract class AuthRepository with AddUser,ManagementUserLocal {
  Future<GoogleSignInAuthentication?> login();
  Future<User?> getUserFromGoogleAuth(GoogleSignInAuthentication? auth);
  Future logout();
}

