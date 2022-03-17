import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//firebase authenticate
FirebaseAuth auth = FirebaseAuth.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();

// firebase firestore
FirebaseFirestore firestore = FirebaseFirestore.instance;
final Future<FirebaseApp> addcow = Firebase.initializeApp();
final Future<FirebaseApp> editcow = Firebase.initializeApp();
final Future<FirebaseApp> deleteSapi = Firebase.initializeApp();
final Future<FirebaseApp> addtask = Firebase.initializeApp();
