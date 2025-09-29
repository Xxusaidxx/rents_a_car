import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car_app/Constants/app_routes.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';

class LoginAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final user = FirebaseAuth.instance.currentUser;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Logged in Succeesfully"),
          backgroundColor: Colors.grey.shade900,
        ),
      );
      Navigator.pushReplacementNamed(context, userhomescreen);
      return true;
    } on FirebaseAuthException catch (e) {
      Uihelper.showSnackBar(context, _handleFirebaseAuthError(e));
      return false;
    }
  }
}

String _handleFirebaseAuthError(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return 'No user found with this email.';
    case 'wrong-password':
      return 'The password you entered is incorrect.';
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'user-disabled':
      return 'This user account has been disabled.';
    case 'too-many-requests':
      return 'Too many login attempts. Please try again later.';
    case 'network-request-failed':
      return 'No internet connection. Please check your network.';
    default:
      debugPrint('Unhandled FirebaseAuthException code: ${e.code}');
      return 'Login failed. ${e.message ?? "An unknown error occurred."}';
  }
}
