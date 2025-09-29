import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
// import 'package:rent_a_car_app/UserPanel/bloc/login_event.dart';

abstract class AdminLoginEvent extends Equatable {}

class LoginEventButton extends AdminLoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  LoginEventButton({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

// @override
// List<Object?> get props => (email,passw);
