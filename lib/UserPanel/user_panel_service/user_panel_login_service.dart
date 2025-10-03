import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:rent_a_car_app/Constants/app_routes.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
import 'package:rent_a_car_app/routes/routes_name.dart';

class LoginAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
     final trimmedEmail = email.trim();
         final trimmedPassword = password.trim();

      // email:
      // email.trim();
      // password:
      // password.trim();
      await _auth.signInWithEmailAndPassword(email:trimmedEmail, password: trimmedPassword);
      final user = FirebaseAuth.instance.currentUser;
      // ignore: use_build_context_synchronously
      Uihelper.showSnackBar(context, "Logged in Successfully");
      Navigator.pushReplacementNamed(context, RoutesName.HomeScreen);
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


// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/widgets.dart';
// import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
// import 'package:rent_a_car_app/routes/routes_name.dart';

// class AdminLoginService {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   Future<bool> Login({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try  {
//       email:
//       email.trim();
//       password:
//       password.trim();
//      await auth.signInWithEmailAndPassword(email: email, password: password);

//       Uihelper.showSnackBar(context, "logged in Successfully");
//       Navigator.pushNamed(context, RoutesName.ownerInformationScreen);
//       return true;
//     } on FirebaseAuthException catch (e) {
//       Uihelper.showSnackBar(context, _handleFirebaseAuthError(e));
//       return false;
//     }
//   }
// }

// String _handleFirebaseAuthError(FirebaseAuthException e) {
//   switch (e.code) {
//     case 'user-not-found':
//       return 'No user found with this email.';
//     case 'wrong-password':
//       return 'The password you entered is incorrect.';
//     case 'invalid-email':
//       return 'The email address is not valid.';
//     case 'user-disabled':
//       return 'This user account has been disabled.';
//     case 'too-many-requests':
//       return 'Too many login attempts. Please try again later.';
//     case 'network-request-failed':
//       return 'No internet connection. Please check your network.';
//     default:
//       debugPrint('Unhandled FirebaseAuthException code: ${e.code}');
//       return 'Login failed. ${e.message ?? "An unknown error occurred."}';
//   }
// }
