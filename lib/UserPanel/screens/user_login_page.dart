import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_app/Constants/app_colors.dart';
import 'package:rent_a_car_app/Constants/app_images.dart';
import 'package:rent_a_car_app/UserPanel/user_bloc/login_bloc.dart';
import 'package:rent_a_car_app/UserPanel/user_bloc/login_event.dart';
import 'package:rent_a_car_app/UserPanel/user_bloc/login_state.dart';
import 'package:rent_a_car_app/UserPanel/user_panel_service/login_validation_service.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
import 'package:rent_a_car_app/routes/routes_name.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          loading = false;
          Navigator.pushNamed(context, RoutesName.HomeScreen);
        } else if (state is LoginLoadingState) {
          loading = true;
        } else if (state is LoginErrorState) {
          loading = false;
          Uihelper.showSnackBar(context, "Login Failed");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Login Page"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Ready to hit the road",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildTextFormField(
                    emailController,
                    "Enter your email:",
                    false,
                    suffixIcon: Icons.email,
                    validator: UserLoginValidationService.validateEmail,
                  ),
                  _buildTextFormField(
                    passwordController,
                    "Enter your email:",
                    false,
                    suffixIcon: Icons.email,
                    validator: UserLoginValidationService.validatePassword,
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_box_rounded),
                      Text(
                        "  Remember Me",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(width: 210),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password ??",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginButtonEvent(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            context: context,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1E2326),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      minimumSize: Size(350, 50),
                    ),
                    child: loading
                        ? CircularProgressIndicator()
                        : Text(
                            "login",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Color(0xFF1E2326),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                        side: BorderSide(color: Colors.black),
                      ),
                      minimumSize: Size(350, 50),
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "_________________ or _____________",
                    style: TextStyle(color: AppColors.lightgrey),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Color(0xFF1E2326),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                        side: BorderSide(color: Colors.black),
                      ),
                      minimumSize: Size(350, 50),
                    ),
                    icon: Image.asset(googleLogo, width: 40, height: 25),
                    label: Text("Sign in with Google"),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                        side: BorderSide(color: Colors.black),
                      ),
                      minimumSize: Size(350, 50),
                    ),
                    icon: Icon(
                      Icons.apple_outlined,
                      color: AppColors.black,
                      size: 30,
                    ),
                    label: Text("Sign in with Apple"),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account ?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
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
