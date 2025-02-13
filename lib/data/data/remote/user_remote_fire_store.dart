import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spendytracking/core/helpers/remote/firebase_helper.dart';
import 'package:spendytracking/data/models/user_model.dart';

class UserRemoteFireStore {
  final FirebaseFireStoreHelper firebaseFireStoreHelper;
  late CollectionReference _userCollectionReference;
  UserRemoteFireStore({required this.firebaseFireStoreHelper}) {
    _userCollectionReference =
        firebaseFireStoreHelper.firebaseFirestore.collection('users');
  }

  Future<void> addUser(UserModel user) {
    return _userCollectionReference.doc(user.userId).set(user.toJson());
  }
}

class UserInformationFirestore extends UserRemoteFireStore {
  UserInformationFirestore({required super.firebaseFireStoreHelper});
  late DocumentSnapshot _userDocumentSnapShot;

  Future<bool> isUserExist(String id) async {
    _userDocumentSnapShot = await _userCollectionReference.doc(id).get();
    return _userDocumentSnapShot.exists;
  }

  UserModel? getUser() {
    final data = _userDocumentSnapShot.data();
    if (data == null) return null;
    return UserModel.fromJson((data as Map<String, dynamic>));
  }
}
