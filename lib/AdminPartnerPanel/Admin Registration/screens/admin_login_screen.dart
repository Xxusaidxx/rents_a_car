import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_app/Constants/app_colors.dart';
import 'package:rent_a_car_app/Constants/app_images.dart';
import 'package:rent_a_car_app/admin_blocs/admin_login_bloc/admin_login_event.dart';
import 'package:rent_a_car_app/admin_blocs/admin_login_bloc/admin_login_state.dart';
import 'package:rent_a_car_app/admin_blocs/admin_login_bloc/admin_loginbloc.dart';
// import 'package:rent_a_car_app/AdminPartnerPanel/owner_information_form.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
import 'package:rent_a_car_app/routes/routes_name.dart';

class AdminLoginScreen extends StatelessWidget {
  bool loading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminLoginbloc, AdminLoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          loading = false;
          Navigator.pushNamed(context, RoutesName.ownerInformationScreen);
        } else if (state is LoginLoadingState) {
          loading = true;
        } else if (state is LoginErrorState) {
          // Show error message
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("failed to logged in")));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Admin Login Page")),
        body: Stack(
          children: [
            Image.asset(CarPng),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.customText("Welcome Back"),
                Uihelper.customText("QuickWheels Partner Program."),
                SizedBox(height: 20),
                _buildTextFormField(
                  emailController,
                  "Enter your email",
                  false,
                  prefixIcon: (Icons.email),
                ),
                _buildTextFormField(
                  passwordController,
                  "Enter your password",
                  false,
                  prefixIcon: (Icons.password),
                ),

                SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AdminLoginbloc>().add(
                        LoginEventButton(
                          email: emailController.text.toLowerCase(),
                          password: passwordController.text.trim(),
                          context: context,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26,
                      // maximumSize: Size(25, 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(googleLogo, width: 40, height: 25),
                  label: Text("Sign in with Google"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password??",
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
      ),
    ),
  );
} 


//  Widget _buildTextFormField(String label, TextEditingController controller) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//       ),
//     ),
//   );
// }


