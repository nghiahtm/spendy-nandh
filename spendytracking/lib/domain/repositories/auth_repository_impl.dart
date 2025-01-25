import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendytracking/data/helpers/remote/firebase_helper.dart';
import 'package:spendytracking/data/helpers/remote/google_auth_helper.dart';
import 'package:spendytracking/data/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseFireStoreHelper firebaseFireStoreHelper;
  final GoogleAuthHelper googleAuthHelper;

  AuthRepositoryImpl(
      {required this.firebaseFireStoreHelper, required this.googleAuthHelper});
  @override
  Future<User?> login() async {
    // Sign in google
    final signIn = await googleAuthHelper.googleSignIn.signIn();
    final auth = await signIn?.authentication;
    final credential = GoogleAuthProvider.credential(
        idToken: auth?.idToken, accessToken: auth?.accessToken);
    // Check Credential And get User Auth
    final user = await firebaseFireStoreHelper.firebaseAuth
        .signInWithCredential(credential);
    return user.user;
  }

  @override
  Future logout() async {
    await googleAuthHelper.googleSignIn.signOut();
    await firebaseFireStoreHelper.firebaseAuth.signOut();
  }
}
