import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  static User? user;
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static var isSigning = false.obs;


  /// Google Sign-In method
  static Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return false; // User canceled the sign-in
      isSigning.value = true;
      // Obtain the authentication details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      // Update user state
      user = userCredential.user;
      // AppStorage.setUid(val: user?.uid ?? "");
      // await FirestoreServices.addUserToFirestore(
      //     newUser: UserModel(
      //   uid: user?.uid ?? "",
      //   name: user?.displayName ?? "",
      //   email: user?.email ?? "",
      //   profileUrl: user?.photoURL ?? "",
      // ));
      return true;
    } catch (e) {
      debugPrint("Error signing in with Google: $e");
      return false;
    }finally {
      isSigning.value = false;
    }
  }
  
}