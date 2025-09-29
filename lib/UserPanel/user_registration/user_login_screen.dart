// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_app/UserPanel/user_panel_service/user_panel_login_service.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/user_signup_screen.dart';
import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
import 'package:rent_a_car_app/UserPanel/bloc/login_bloc.dart';
import 'package:rent_a_car_app/UserPanel/bloc/login_event.dart';
import 'package:rent_a_car_app/UserPanel/bloc/login_state.dart';

// import 'package:rent_a_car_app/main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginAuthService()),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.customText("Welcome Back"),
            Uihelper.customText("Ready To Hit The Road."),
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
                suffixIcon: Icons.email,
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
                suffixIcon: Icons.password,
              ),
            ),
            SizedBox(height: 10),
            BlocConsumer<LoginBloc, LoginState>(
  listener: (context, state) {
    if (state is LoginSuccessState) {
      // Navigate to next screen or show success message
      Navigator.pushReplacementNamed(context, "/home");
    } else if (state is LoginErrorState) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  builder: (context, state) {
    if (state is LoginLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ElevatedButton(onPressed: (){
      context.read<LoginBloc>().add(LoginButtonEvent(email: emailController.text.trim(), password: passwordController.text.trim(), context: context));
    }, child: Text("Login")
    );
  },
),

            SizedBox(height: 10),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password??",
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                SizedBox(width: 9),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//www.figma.com/design/J6gRpluTRmv0pMKub07eJQ/Car-Rental-App-UI---UX-Design--Community-?node-id=0-1&p=f&t=Xhc2tyWd51r0pX0t-0
