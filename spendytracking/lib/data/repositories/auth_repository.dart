import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepository {
  Future<GoogleSignInAuthentication?> login();
  Future<User?> getUser(GoogleSignInAuthentication? auth);
  Future logout();
}
