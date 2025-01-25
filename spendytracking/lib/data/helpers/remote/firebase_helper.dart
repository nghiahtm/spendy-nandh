import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFireStoreHelper{
  late FirebaseFirestore firebaseFirestore;
  late FirebaseAuth firebaseAuth;


  FirebaseFireStoreHelper init() {
    firebaseFirestore = FirebaseFirestore.instance;
    firebaseAuth = FirebaseAuth.instance;
    return this;
  }
}