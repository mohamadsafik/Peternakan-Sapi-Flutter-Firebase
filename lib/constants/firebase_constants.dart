import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
// AuthController authController = AuthController.nstance;
// final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
// FirebaseAuth auth = FirebaseAuth.instance;
// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
// GoogleSignIn googleSign = GoogleSignIn();

FirebaseFirestore firestore = FirebaseFirestore.instance;

final Future<FirebaseApp> addcow = Firebase.initializeApp();

// FirebaseFirestore _editCow = FirebaseFirestore.instance;
final Future<FirebaseApp> editcow = Firebase.initializeApp();

final Future<FirebaseApp> deleteSapi = Firebase.initializeApp();
