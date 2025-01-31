import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendytracking/data/helpers/remote/firebase_helper.dart';
import 'package:spendytracking/data/helpers/remote/google_auth_helper.dart';
import 'package:spendytracking/data/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseFireStoreHelper firebaseFireStoreHelper;
  final GoogleAuthHelper googleAuthHelper;

  AuthRepositoryImpl(
      {required this.firebaseFireStoreHelper, required this.googleAuthHelper});
  @override
  Future<GoogleSignInAuthentication?> login() async {
    // Sign in google
    final signIn = await googleAuthHelper.googleSignIn.signIn();
    return signIn?.authentication;

  }

  @override
  Future logout() async {
    await googleAuthHelper.googleSignIn.signOut();
    await firebaseFireStoreHelper.firebaseAuth.signOut();
  }

  @override
  Future<User?> getUser(GoogleSignInAuthentication? auth)async {
    final credential = GoogleAuthProvider.credential(
        idToken: auth?.idToken, accessToken: auth?.accessToken);
    // Check Credential And get User Auth
    final user = await firebaseFireStoreHelper.firebaseAuth
        .signInWithCredential(credential);
    return user.user;
  }
}
