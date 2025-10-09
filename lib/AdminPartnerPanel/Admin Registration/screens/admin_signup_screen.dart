import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/Admin%20Registration/screens/admin_login_screen.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
import 'package:rent_a_car_app/routes/routes_name.dart';

// CHANGE KRNEE HAI ABHI USER WALI SIGNUP SCREEN COPY KEE HAI

class AdminSignupScreen extends StatelessWidget {
  AdminSignupScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.customText("Sign Up"),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            child: Uihelper.customTextFormField(
              controller: emailController,
              obsecureText: false,
              labelText: "Email",
              hintText: "Enter your email:",
              prefixIcon: Icons.email,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            child: Uihelper.customTextFormField(
              controller: passwordController,
              obsecureText: true,
              labelText: "password",
              hintText: "Enter your password:",
              prefixIcon: Icons.password,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              SignUp(context);
            },
            child: Text("SignUp"),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.adminLoginScreen);
            },
            child: Text("LogIn"),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.adminLoginScreen);
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 19, color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
