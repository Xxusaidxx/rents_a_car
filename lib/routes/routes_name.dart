// import 'package:flutter/material.dart';
// import 'package:rent_a_car_app/AdminPartnerPanel/owner_information_form.dart';
// import 'package:rent_a_car_app/Constants/app_routes.dart';
// import 'package:rent_a_car_app/UserPanel/screens/home_screen.dart';
// import 'package:rent_a_car_app/UserPanel/user_registration/login_page.dart';

// class RoutesUtils {
//   static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case owner:
//         return MaterialPageRoute(builder: (context) => OwnerInformation());
//       case userlogin:
//         return MaterialPageRoute(builder: (context) => LoginPage());

//       case userhomescreen:
//         return MaterialPageRoute(builder: (context) => HomeScreen());

//       default:
//         return MaterialPageRoute(
//           builder: (context) => Scaffold(body: Text("No Page found")),
//         );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/Admin%20Registration/screens/admin_onboarding_screen.dart';

class RoutesName {
  static const String adminOnboardingScreen = '/AdminOnboardingScreen;';
  static const String ownerInformationScreen = '/OwnerInformationscreen';
  static const String adminLoginScreen = '/adminLoginScreen';
  static const String AdminSignupScreen = "/adminSignupScreen";
  static const String HomeScreen = "/HomeScreen";
  static const String UserLoginScreen = "/LoginPage";
  static const String UseronBoarding = "/User_On_Boarding";
}
