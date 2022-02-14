part of 'forgotten_form_bloc.dart';

abstract class ForgottenFormState extends Equatable {
  const ForgottenFormState();

  @override
  List<Object> get props => [];
}

class ForgottenFormInitialState extends ForgottenFormState {}

class ForgottenFormLoadingState extends ForgottenFormState {}

class ForgottenFormSuccessState extends ForgottenFormState {}
