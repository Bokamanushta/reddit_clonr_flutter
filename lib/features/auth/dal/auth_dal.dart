import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit_clone/core/providers/firebase_providers.dart';

final authDALProvider = Provider((ref) => AuthDAL(
      firebaseFirestore: ref.read(firestoreProvider),
      firebaseAuth: ref.read(authProvider),
      googleSignIn: ref.read(googleSignInProvider),
    ));

class AuthDAL {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthDAL(
      {required FirebaseFirestore firebaseFirestore,
      required FirebaseAuth firebaseAuth,
      required GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore,
        _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final authentication = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication?.accessToken,
          idToken: authentication?.idToken);

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      print(userCredential);
    } catch (e) {
      print(e);
    }
  }
}
