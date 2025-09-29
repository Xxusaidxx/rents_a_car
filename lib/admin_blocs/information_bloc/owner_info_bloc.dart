import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_app/AdminPartnerPanel/admin_firebase_service/owner_info_service.dart';
import 'package:rent_a_car_app/admin_blocs/information_bloc/owner_info_event.dart';
import 'package:rent_a_car_app/admin_blocs/information_bloc/owner_info_state.dart';

class OwnerInfoBloc extends Bloc<OwnerInfoEvent, OwnerInfoState> {
  final OwnerInfoService _infoService;
  OwnerInfoBloc(this._infoService) : super(OwnerInitialState()) {
    on<InformationSubmitEvent>((event, emit) async {
      emit(OwnerLoadingState());
      try {
        final success =await _infoService.SaveOwnerInfo(
          name: event.name,
          email: event.email,
          phone: event.phone,
          ownerId: event.ownerId,
          carRegistrationNumber: event.carRegistrationNumber,
          aboutCar: event.aboutCar,
        );
        if (success) {
          emit (OwnerSuccessState());
        } else {
          emit(OwnerErrorState(error: "Failed To Submit Information"));
        }
      } catch (e) {
        emit (OwnerErrorState(error: e.toString()));
      }
    });
  }
}
