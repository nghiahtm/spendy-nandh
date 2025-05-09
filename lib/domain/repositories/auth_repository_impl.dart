import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendytracking/core/helpers/remote/firebase_helper.dart';
import 'package:spendytracking/core/helpers/remote/google_auth_helper.dart';
import 'package:spendytracking/data/data/local/user_local_sqflite.dart';
import 'package:spendytracking/data/data/local/user_share_pref.dart';
import 'package:spendytracking/data/data/remote/user_remote_fire_store.dart';
import 'package:spendytracking/data/models/user_model.dart';

import 'package:spendytracking/data/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseFireStoreHelper firebaseFireStoreHelper;
  final GoogleAuthHelper googleAuthHelper;
  final UserRemoteFireStore userRemoteFireStore;
  final UserSharePref userSharePref;
  final UserInformationFirestore userInformationFirestore;
  final UserSqflite userSqflite;

  AuthRepositoryImpl(
      {required this.firebaseFireStoreHelper,
      required this.googleAuthHelper,
      required this.userSharePref,
      required this.userRemoteFireStore,
      required this.userInformationFirestore,
      required this.userSqflite});

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
  Future<User?> getUserFromGoogleAuth(GoogleSignInAuthentication? auth) async {
    final credential = GoogleAuthProvider.credential(
        idToken: auth?.idToken, accessToken: auth?.accessToken);
    // Check Credential And get User Auth
    final user = await firebaseFireStoreHelper.firebaseAuth
        .signInWithCredential(credential);
    return user.user;
  }

  @override
  Future<void> addUserToFirestore(UserModel user) =>
      userRemoteFireStore.addUser(user);

  @override
  Future<void> addUserLocal(String id) {
    return userSharePref.setUserLocal(id);
  }

  @override
  Future<String?> getIdUserLocal() {
    return userSharePref.getUserLocal();
  }

  @override
  Future<bool> isUserInFireStore(String id) {
    return userInformationFirestore.isUserExist(id);
  }

  @override
  UserModel? getUserFromFirestore() {
    return userInformationFirestore.getUser();
  }

  @override
  Future<void> createTableUser() {
    return userSqflite.createUser();
  }

  @override
  Future<UserModel?> getUserFromSqflite(int idLocal) {
    return userSqflite.getUser(idLocal);
  }

  @override
  Future<int> insertUserSqflite(UserModel user) {
    return userSqflite.insertUser(user);
  }

  @override
  Future<int?> getIntIdUserLocal() {
    return userSharePref.getIdLocal();
  }

  @override
  Future<void> setIntIdUserLocal(int id) {
    return userSharePref.setIDLocal(id);
  }
}
