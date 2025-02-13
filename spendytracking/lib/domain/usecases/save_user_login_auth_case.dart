import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:spendytracking/data/models/user_model.dart';
import 'package:spendytracking/utils/extensions/user_firebase_extension.dart';

import 'auth_usecase.dart';


class SaveUserToSqliteUseCase extends AuthUseCase {
  SaveUserToSqliteUseCase({required super.authRepository});
  String? error;
  @override
  Future<String?> stateUserLogin() async {
    try {
      /// TODO: Check User Login google
      final auth = await authRepository.login();
      if (auth == null) {
        return "Not Log in";
      }

      /// Get User from google auth and check a
      final user = await authRepository.getUserFromGoogleAuth(auth);
      if (user == null) {
        return "Not Found User";
      }

      /// TODO: GET user state user on firestore
      await _createTable();
      final isExistedUserOnFirebase = await _isUserStillOnFirestore(user.uid);
      if (!isExistedUserOnFirebase) {
        await _getStateAddUserToFirebase(user.userModel);
      }
      /// TODO: Get USER on Firestore
      userModel = authRepository.getUserFromFirestore();
      /// TODO: CREATE check table is existed and create
      await addUserTOSQLite();
      await setUserIdLocal();
      return null;
    } on PlatformException catch (e) {
      return "Exception Platform";
    } on FirebaseException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> setUserIdLocal() async {
    // TODO: implement setUserIdLocal
    if (isUserNull().isNotEmpty) return isUserNull();
    // TODO: SAVE ID LOCAL to SQLITE
    await authRepository.setIntIdUserLocal(userModel!.idLocal);
    return "";
  }

  Future<bool> _isUserStillOnFirestore(String id) async {
    final isExisted = await authRepository.isUserInFireStore(id);
    return isExisted;
  }

  Future<void> addUserTOSQLite() async {
    final id = await authRepository.insertUserSqflite(userModel!);
    await authRepository.setIntIdUserLocal(id);
  }

  Future<String> getInforUserSQLite() async {
    final idLocal = await authRepository.getIntIdUserLocal();
    if (idLocal == null) return "Not Existed";
    userModel = await authRepository.getUserFromSqflite(idLocal);
    return "";
  }

  Future<void> _createTable() async => authRepository.createTableUser();

  Future<void> _getStateAddUserToFirebase(UserModel user) async {
    await authRepository.addUserToFirestore(user);
  }
}
