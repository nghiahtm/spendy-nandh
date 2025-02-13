import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:spendytracking/data/models/user_model.dart';
import 'package:spendytracking/data/repositories/auth_repository.dart';
import 'package:spendytracking/utils/extensions/user_firebase_extension.dart';


class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  UserModel? userModel;

  Future<String?> stateUserLogin() async {
    try {
      final auth = await authRepository.login();
      if (auth == null) {
        return "Not Log in";
      }
      final user = await authRepository.getUserFromGoogleAuth(auth);
      if (user == null) {
        return "Not Found User";
      }
      userModel = user.userModel;
      return null;
    } on PlatformException catch (e) {
      return "Exception Platform";
    }
  }

  Future<String?> addUserToFirestore() async {
    try {
      if (userModel == null) return "Not Found";
      await authRepository.addUserToFirestore(userModel!);
      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String?> getUserLocal() async {
    final id = await authRepository.getIdUserLocal();
    if (id == null || id.isEmpty) {
      return null;
    }
    return id;
  }

  Future<String?> setUserIdLocal() async {
    if(isUserNull().isNotEmpty ) return isUserNull();
    await authRepository.addUserLocal(userModel!.userId!);
    return null;
  }

  Future<String> getStateUserStillOnFirestore() async {
    if (userModel == null ||
        userModel?.userId == null ||
        userModel!.userId!.isEmpty) {
      return "Not Found User";
    }
    final isExisted =
        await authRepository.isUserInFireStore(userModel!.userId!);
    if (!isExisted) return "Not Existed";
    userModel = authRepository.getUserFromFirestore();
    await setUserIdLocal();
    return "";
  }

  String isUserNull (){
    if (userModel == null ||
        userModel!.userId == null ||
        userModel!.userId!.isEmpty) return "Not Found User";
    return "";
  }
}
