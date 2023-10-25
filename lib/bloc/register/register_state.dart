part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  final RegisterResponseModel model;

  RegisterLoaded({required this.model});
}

final class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});
}
