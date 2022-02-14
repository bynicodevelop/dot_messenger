part of 'forgotten_form_bloc.dart';

abstract class ForgottenFormEvent extends Equatable {
  const ForgottenFormEvent();

  @override
  List<Object> get props => [];
}

class OnForgottenFormEvent extends ForgottenFormEvent {
  final String email;

  const OnForgottenFormEvent({
    required this.email,
  });

  @override
  List<Object> get props => [
        email,
      ];
}
