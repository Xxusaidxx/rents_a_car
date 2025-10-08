import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car_app/Constants/app_colors.dart';
import 'package:rent_a_car_app/Constants/app_images.dart';
import 'package:rent_a_car_app/UserPanel/user_panel_service/login_validation_service.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
import 'package:rent_a_car_app/routes/routes_name.dart';

// CHANGE KRNEE HAI ABHI USER WALI SIGNUP SCREEN COPY KEE HAI

class UserSignupPage extends StatelessWidget {
  UserSignupPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //Signup function for email/password Authentication

  void SignUp(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Uihelper.showSnackBar(context, "please fill the required fields");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Successfully creating users on firebase");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Successfully SignUp")));
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("SOMETHING WENT WRONG")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 90.0),
                      child: Image.asset(CarPng),
                    ),
                  ],
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                _buildTextFormField(
                  emailController,
                  "Enter your Email:",
                  false,
                  suffixIcon: Icons.email,
                  // validator: UserLoginValidationService.validateEmail,
                ),
                SizedBox(height: 10),
                _buildTextFormField(
                  passwordController,
                  "Enter your password:",
                  false,
                  suffixIcon: Icons.password,
                  // validator: UserLoginValidationService.validatePassword,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    SignUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1E2326),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    minimumSize: Size(390, 62),
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.UserLoginScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Color(0xFF1E2326),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                      side: BorderSide(color: Color(0xFFD7D7D7)),
                    ),
                    minimumSize: Size(392, 62),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "_______________________ or _______________________",
                  style: TextStyle(color: AppColors.lightgrey),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Color(0xFF1E2326),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                      side: BorderSide(color: Color(0xFFD7D7D7)),
                    ),
                    minimumSize: Size(392, 62),
                  ),
                  icon: Image.asset(googleLogo, width: 40, height: 25),
                  label: Text("Sign up with Google"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                      side: BorderSide(color: Color(0xFFD7D7D7)),
                    ),
                    minimumSize: Size(392, 62),
                  ),
                  icon: Icon(
                    Icons.apple_outlined,
                    color: AppColors.black,
                    size: 30,
                  ),
                  label: Text("Sign up with Apple"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.UserLoginScreen,
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextFormField(
  TextEditingController controller,
  String hintText,
  bool obsecureText, {
  IconData? prefixIcon,
  suffixIcon,
  String? Function(String?)? validator, //
}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextFormField(
      controller: controller,
      obscureText: obsecureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
      ),
    ),
  );
}
