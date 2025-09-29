import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';

abstract class AdminLoginState extends Equatable {}

class LoginInitialState extends AdminLoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoadingState extends AdminLoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends AdminLoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginErrorState extends AdminLoginState {
  final String message;
  LoginErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
