part of 'register_form_bloc.dart';

abstract class RegisterFormEvent extends Equatable {
  const RegisterFormEvent();

  @override
  List<Object> get props => [];
}

class OnRegisterFormEvent extends RegisterFormEvent {
  final String name;
  final String email;
  final String password;

  const OnRegisterFormEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
      ];
}
