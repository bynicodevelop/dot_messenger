part of 'login_form_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String errorMessage;

  const LoginFailureState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [
        errorMessage,
      ];
}
