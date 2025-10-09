import 'package:flutter/material.dart';
import 'package:rent_a_car_app/Constants/app_strings.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Reset Your Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.ResetPasswordText,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, RoutesName.userSignupScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E2326),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  minimumSize: Size(350, 50),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Return to sign in",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 28),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Create a new account",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
