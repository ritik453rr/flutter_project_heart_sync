import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heart_sync/common/app_storage.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/reauthentication/reauthentication_view.dart';
import 'package:heart_sync/routing/app_routes.dart';

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
      UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );

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
    } finally {
      isSigning.value = false;
    }
  }

  /// method to logout the user from the application
  static Future<void> logout() async {
    await GoogleSignIn().signOut();
    await auth.signOut();
    AppStorage.setLoginStatus(false);
  }

  static Future<void> deleteAccount() async {
    try {
      await auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        Get.toNamed(AppRoutes.reauthentication);
      }
    }
  }

  static Future<void> reauthenticateDeleteAc(
    String email,
    String password,
  ) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Create auth credentials
        AuthCredential credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );

        // Reauthenticate
        await user.reauthenticateWithCredential(credential);
        print("Reauthentication successful!");
        deleteAccount();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        print("Wrong password provided.");
      } else if (e.code == 'user-mismatch') {
        print("Credential does not match the current user.");
      } else {
        print("Reauthentication error: ${e.message}");
      }
    }
  }
}
