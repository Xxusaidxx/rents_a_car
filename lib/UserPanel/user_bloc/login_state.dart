import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  String? get message => null;
}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
