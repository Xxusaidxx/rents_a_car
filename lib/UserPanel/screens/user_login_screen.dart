// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rent_a_car_app/Constants/app_images.dart';
// import 'package:rent_a_car_app/UserPanel/user_panel_service/login_validation_service.dart';
// // import 'package:rent_a_car_app/UserPanel/user_panel_service/user_panel_login_service.dart';
// import 'package:rent_a_car_app/UserPanel/screens/user_signup_screen.dart';
// import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
// import 'package:rent_a_car_app/UserPanel/user_bloc/login_bloc.dart';
// import 'package:rent_a_car_app/UserPanel/user_bloc/login_event.dart';
// import 'package:rent_a_car_app/UserPanel/user_bloc/login_state.dart';
// import 'package:rent_a_car_app/routes/routes_name.dart';

// // import 'package:rent_a_car_app/main.dart';

// class LoginPage extends StatelessWidget {
//   bool loading = false;

//   LoginPage({super.key});
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, state) {
//         if (state is LoginSuccessState) {
//           loading = false;
//           Navigator.pushNamed(context, RoutesName.ownerInformationScreen);
//         } else if (state is LoginLoadingState) {
//           loading = true;
//         } else if (state is LoginErrorState) {
//           // Show error message
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text("failed to logged in")));
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(title: Text("User Login Page")),
//         body: Form(
//           key: _formKey,
//           child: Stack(
//             children: [
//               Image.asset(CarPng),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Uihelper.customText("Welcome Back"),
//                   Uihelper.customText("Take A Car On Rent"),
//                   SizedBox(height: 20),
//                   _buildTextFormField(
//                     emailController,
//                     "Enter your email",
//                     false,
//                     prefixIcon: (Icons.email),
//                     validator: LoginValidationService.validateEmail,
//                   ),
//                   _buildTextFormField(
//                     passwordController,
//                     "Enter your password",
//                     false,
//                     prefixIcon: (Icons.password),
//                     validator: LoginValidationService.validatePassword,
//                   ),

//                   SizedBox(height: 10),
//                   SizedBox(
//                     width: 300,
//                     height: 45,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           context.read<LoginBloc>().add(
//                             LoginButtonEvent(
//                               email: emailController.text.toLowerCase(),
//                               password: passwordController.text.trim(),
//                               context: context,
//                             ),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black26,
//                         // maximumSize: Size(25, 6),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: Image.asset(googleLogo, width: 40, height: 25),
//                     label: Text("Sign in with Google"),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "Forgot Password??",
//                           style: TextStyle(fontSize: 21),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   SizedBox(width: 9),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignUpPage()),
//                       );
//                     },
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(fontSize: 25, color: Colors.blueAccent),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _buildTextFormField(
//   TextEditingController controller,
//   String hintText,
//   bool obsecureText, {
//   IconData? prefixIcon,
//   suffixIcon,
//   String? Function(String?)? validator, //
// }) {
//   return Padding(
//     padding: const EdgeInsets.all(8),
//     child: TextFormField(
//       controller: controller,
//       obscureText: obsecureText,
//       validator: validator,
//       decoration: InputDecoration(
//         hintText: hintText,
//         prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//         suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
//       ),
//     ),
//   );
// }

// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rent_a_car_app/UserPanel/screens/user_signup_screen.dart';
// import 'package:rent_a_car_app/UserPanel/user_bloc/login_bloc.dart';
// import 'package:rent_a_car_app/UserPanel/user_bloc/login_event.dart';
// import 'package:rent_a_car_app/UserPanel/user_bloc/login_state.dart';
// import 'package:rent_a_car_app/UserPanel/user_panel_service/user_panel_login_service.dart';
// // import 'package:rent_a_car_app/UserPanel/user_registration/user_signup_screen.dart';
// import 'package:rent_a_car_app/UserPanel/user_registration/ui_helper.dart';
// // import 'package:rent_a_car_app/UserPanel/bloc/login_bloc.dart';
// // import 'package:rent_a_car_app/UserPanel/bloc/login_event.dart';
// // import 'package:rent_a_car_app/UserPanel/bloc/login_state.dart';

// // import 'package:rent_a_car_app/main.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginBloc(LoginAuthService()),

//       child: Scaffold(
//         appBar: AppBar(title: Text("User Login Page")),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Uihelper.customText("Welcome Back"),
//             Uihelper.customText("Ready To Hit The Road."),
//             SizedBox(height: 20),

//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 15.0,
//                 vertical: 15.0,
//               ),
//               child: Uihelper.customTextFormField(
//                 controller: emailController,
//                 obsecureText: false,
//                 labelText: "Email",
//                 hintText: "Enter your email:",
//                 suffixIcon: Icons.email,
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 15.0,
//                 vertical: 15.0,
//               ),
//               child: Uihelper.customTextFormField(
//                 controller: passwordController,
//                 obsecureText: true,
//                 labelText: "password",
//                 hintText: "Enter your password:",
//                 suffixIcon: Icons.password,
//               ),
//             ),
//             SizedBox(height: 10),
//             BlocConsumer<LoginBloc, LoginState>(
//               listener: (context, state) {
//                 if (state is LoginSuccessState) {
//                   // Navigate to next screen or show success message
//                   Navigator.pushReplacementNamed(context, "/home");
//                 } else if (state is LoginErrorState) {
//                   // Show error message
//                   ScaffoldMessenger.of(
//                     context,
//                   ).showSnackBar(SnackBar(content: Text(state.message)));
//                 }
//               },
//               builder: (context, state) {
//                 if (state is LoginLoadingState) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 return ElevatedButton(
//                   onPressed: () {
//                     context.read<LoginBloc>().add(
//                       LoginButtonEvent(
//                         email: emailController.text.trim(),
//                         password: passwordController.text.trim(),
//                         context: context,
//                       ),
//                     );
//                   },
//                   child: Text("Login"),
//                 );

//                 // return Uihelper.customElevatedButton(() {
//                 //   context.read<LoginBloc>().add(
//                 //     LoginButtonEvent(
//                 //       email: emailController.text.trim(),
//                 //       password: passwordController.text.trim(),
//                 //     ),
//                 //   );
//                 // }, "LOGIN");
//               },
//             ),

//             SizedBox(height: 10),
//             Row(
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Forgot Password??",
//                     style: TextStyle(fontSize: 21),
//                   ),
//                 ),
//                 SizedBox(width: 9),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpPage()),
//                     );
//                   },
//                   child: Text(
//                     "Sign Up",
//                     style: TextStyle(fontSize: 25, color: Colors.blueAccent),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//     return BlocProvider(
//       create: (context) => LoginBloc(LoginAuthService()),
//       child: Scaffold(
//         appBar: AppBar(title: Text("User Login Page")),
//         body: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Uihelper.customText("Welcome Back"),
//               Uihelper.customText("Ready To Hit The Road."),
//               SizedBox(height: 20),
          
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15.0,
//                   vertical: 15.0,
//                 ),
//                 child: Uihelper.customTextFormField(
//                   controller: emailController,
//                   obsecureText: false,
//                   labelText: "Email",
//                   hintText: "Enter your email:",
//                   suffixIcon: Icons.email,
//                   validator: LoginValidationService.validateEmail,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15.0,
//                   vertical: 15.0,
//                 ),
//                 child: Uihelper.customTextFormField(
//                   controller: passwordController,
//                   obsecureText: true,
//                   labelText: "password",
//                   hintText: "Enter your password:",
//                   suffixIcon: Icons.password,
//                   validator: LoginValidationService.validatePassword,
//                 ),
//               ),
//               SizedBox(height: 10),
//               BlocConsumer<LoginBloc, LoginState>(
//                 listener: (context, state) {
//                   if (state is LoginSuccessState) {

//                     print("Login successfully");
//                     // Navigate to next screen or show success message
//                     Navigator.pushReplacementNamed(
//                       context,
//                       RoutesName.HomeScreen,
//                     );
//                   } else if (state is LoginErrorState) {
//                     print("Error is here $Error");
//                     // Show error message
//                     ScaffoldMessenger.of(
//                       context,
//                     ).showSnackBar(SnackBar(content: Text(state.message)));
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state is LoginLoadingState) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
          
//                   return ElevatedButton(
//                     onPressed: () {
//                       if(_formKey.currentState!.validate()){
                        
//                       context.read<LoginBloc>().add(
//                         LoginButtonEvent(
//                           email: emailController.text.trim(),
//                           password: passwordController.text.trim(),
//                           context: context,
//                         ),
//                       );
//                       }
                    
//                     },
//                     child: Text("Login"),
//                   );
//                 },
//               ),
          
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       "Forgot Password??",
//                       style: TextStyle(fontSize: 21),
//                     ),
//                   ),
//                   SizedBox(width: 9),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignUpPage()),
//                       );
//                     },
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(fontSize: 25, color: Colors.blueAccent),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//www.figma.com/design/J6gRpluTRmv0pMKub07eJQ/Car-Rental-App-UI---UX-Design--Community-?node-id=0-1&p=f&t=Xhc2tyWd51r0pX0t-0
