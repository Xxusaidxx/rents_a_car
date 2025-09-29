import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/Admin%20Registration/screens/owner_information_form.dart';
import 'package:rent_a_car_app/Constants/app_images.dart';
import 'package:rent_a_car_app/Constants/app_routes.dart';
import 'package:rent_a_car_app/Constants/app_strings.dart';
import 'package:rent_a_car_app/routes/routes_name.dart';

class AdminOnboardingScreen extends StatelessWidget {
  const AdminOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(blackCar, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: SvgPicture.asset(carIcon),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Column(
              children: [
                Text(
                  "Welcome To ",
                  style: TextStyle(fontSize: 33, color: Colors.black),
                ),
                Text(
                  "Admin Partner Program",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300, left: 5, right: 5),
                  child: Text(
                    AppStrings.onBoardingText,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.adminLoginScreen,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 105, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
