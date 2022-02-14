part of 'register_form_bloc.dart';

abstract class RegisterFormState extends Equatable {
  const RegisterFormState();

  @override
  List<Object> get props => [];
}

class RegisterFormInitialState extends RegisterFormState {}

class RegisterFormLoadingState extends RegisterFormState {}

class RegisterFormSuccessState extends RegisterFormState {}

class RegisterFormFailureState extends RegisterFormState {
  final String error;

  const RegisterFormFailureState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
