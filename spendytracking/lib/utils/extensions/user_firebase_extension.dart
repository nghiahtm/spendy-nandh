
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendytracking/data/models/user_model.dart';

extension ParseUser on User {
  UserModel? get userModel => UserModel(
    userId: uid,
    avatar: photoURL,
    name: displayName
  );
}