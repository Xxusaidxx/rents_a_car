import 'package:flutter/widgets.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/Admin%20Registration/screens/admin_login_screen.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/Admin%20Registration/screens/admin_onboarding_screen.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/Admin%20Registration/screens/admin_signup_screen.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/Admin%20Registration/screens/owner_information_form.dart';
import 'package:rent_a_car_app/UserPanel/screens/home_screen.dart';
import 'package:rent_a_car_app/UserPanel/screens/user_on_boarding.dart';
import 'package:rent_a_car_app/UserPanel/screens/user_login_screen.dart';
import 'package:rent_a_car_app/routes/routes_name.dart';

class AppPages {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RoutesName.adminOnboardingScreen: (context) => AdminOnboardingScreen(),
      RoutesName.ownerInformationScreen:(context)=>OwnerInformation(),
      RoutesName.adminLoginScreen:(context)=>AdminLoginScreen(),
      RoutesName.AdminSignupScreen:(context)=>AdminSignupScreen(),
      RoutesName.HomeScreen:(context)=>HomeScreen(),
      RoutesName.UserLoginScreen:(context)=>LoginPage(),
      RoutesName.UseronBoarding:(context)=>User_On_Boarding(),
    };
  }
}
