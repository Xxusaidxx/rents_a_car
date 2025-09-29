import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonEvent extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  LoginButtonEvent({required this.email, required this.password ,required this.context});
  @override
  List<Object?> get props => [email, password];
}
