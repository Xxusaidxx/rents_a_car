import 'package:equatable/equatable.dart';

abstract class OwnerInfoEvent extends Equatable {}

class InformationSubmitEvent extends OwnerInfoEvent {
  final String name;
  final String email;
  final String phone;
  final String ownerId;
  final String carRegistrationNumber;
  final String aboutCar;

  InformationSubmitEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.ownerId,
    required this.carRegistrationNumber,
    required this.aboutCar,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [name,email,phone,ownerId,carRegistrationNumber,aboutCar];
}
