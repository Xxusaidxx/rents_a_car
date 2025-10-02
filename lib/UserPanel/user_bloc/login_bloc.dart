import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_app/UserPanel/user_panel_service/user_panel_login_service.dart';
import 'package:rent_a_car_app/UserPanel/user_bloc/login_event.dart';
import 'package:rent_a_car_app/UserPanel/user_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginAuthService _authService;
  LoginBloc(this._authService) : super(LoginInitialState()) {
    on<LoginButtonEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        final success = await _authService.login(
          email: event.email,
          password: event.password,
          context: event.context,
        );
        if (success) {
          emit(LoginSuccessState());
        } else {
          LoginErrorState(message: "Login Failed");
        }
      } catch (e) {
        LoginErrorState(message: (e.toString()));
      }
    });

    // emit(LoginLoadingState());
  }
}
