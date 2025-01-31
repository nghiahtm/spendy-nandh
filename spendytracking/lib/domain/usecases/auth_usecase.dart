import 'package:cloud_firestore/cloud_firestore.dart';
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
      if (auth == null){
        return "Not Log in";
      }
      final user = await authRepository.getUser(auth);
      if (user == null) {
        return "Not Found User";
      }
      userModel = user.userModel;
      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
