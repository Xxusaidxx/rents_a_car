
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_app/admin_blocs/admin_login_bloc/admin_login_event.dart';
import 'package:rent_a_car_app/admin_blocs/admin_login_bloc/admin_login_state.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/admin_authentication_service/login_service.dart';

class AdminLoginbloc extends Bloc<AdminLoginEvent, AdminLoginState> {
  final AdminLoginService _loginService;
  AdminLoginbloc(this._loginService) : super(LoginInitialState()) {
    on<LoginEventButton>((event, emit) async  {
      emit(LoginLoadingState());

      try{
        final success = await _loginService.Login(email: event.email, password: event.password, context: event.context);
        if(success){
          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState(message:"Login Failed"));
        }        
      } catch (e) {
        emit(LoginErrorState(message: e.toString()));
      }
    });
  }
}
