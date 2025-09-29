import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_a_car_app/Constants/app_colors.dart';
import 'package:rent_a_car_app/Constants/app_images.dart';
import 'package:rent_a_car_app/Constants/app_routes.dart';
import 'package:rent_a_car_app/Constants/app_strings.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';

class User_On_Boarding extends StatefulWidget {
  const User_On_Boarding({super.key});

  @override
  State<User_On_Boarding> createState() => _User_On_BoardingState();
}

class _User_On_BoardingState extends State<User_On_Boarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(niceCar, fit: BoxFit.cover),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 15),
                    child: SvgPicture.asset(carIcon),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 148),
                child: Text(
                  AppStrings.userOnBoardingText1,
                  style: TextStyle(fontSize: 33, color: AppColors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 128.0),
                child: Text(
                  AppStrings.userOnBoardingText2,
                  style: TextStyle(fontSize: 33, color: AppColors.white),
                ),
              ),
              SizedBox(height: 380),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, userlogin);
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
        ],
      ),
    );
  }
}
