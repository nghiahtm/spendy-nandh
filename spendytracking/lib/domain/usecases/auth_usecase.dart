import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spendytracking/data/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<String?> checkLoginSuccess() async {
    try {
      final user = await authRepository.login();
      if (user == null) {
        return "Not Found User";
      }
      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}
