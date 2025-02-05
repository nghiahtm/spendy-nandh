import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spendytracking/core/helpers/remote/firebase_helper.dart';
import 'package:spendytracking/data/models/user_model.dart';

class UserRemoteFireStore {
  final FirebaseFireStoreHelper firebaseFireStoreHelper;
  late CollectionReference _users;
  UserRemoteFireStore({required this.firebaseFireStoreHelper}) {
    _users = firebaseFireStoreHelper.firebaseFirestore.collection('users');
  }

  Future<void> addUser(UserModel user) {
    return _users.doc(user.userId).set(user.toJson());
  }
}
