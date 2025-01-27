import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spendytracking/data/models/user_model.dart';
import 'package:spendytracking/data/repositories/auth_repository.dart';
import 'package:spendytracking/utils/extensions/user_firebase_extension.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  UserModel? userModel;

  Future<UserModel?> getUser()async{
    final user = await authRepository.login();
    return userModel = user?.userModel;
  }

  Future<String?> checkLoginSuccess() async {
    try {
      final user = await getUser();
      if (user == null) {
        return "Not Found User";
      }
      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
