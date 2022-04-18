import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

//firebase authenticate
FirebaseAuth auth = FirebaseAuth.instance;

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();

// firebase storage
FirebaseStorage storage = FirebaseStorage.instance;

// firebase firestore
FirebaseFirestore firestore = FirebaseFirestore.instance;
