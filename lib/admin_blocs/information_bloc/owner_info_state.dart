import 'package:equatable/equatable.dart';

abstract class OwnerInfoState extends Equatable {}

class OwnerInitialState extends OwnerInfoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OwnerLoadingState extends OwnerInfoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OwnerSuccessState extends OwnerInfoState {
  final String message;
  OwnerSuccessState({this.message = "Information Submitted Successfully"});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class OwnerErrorState extends OwnerInfoState {
  final String error;
  OwnerErrorState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
