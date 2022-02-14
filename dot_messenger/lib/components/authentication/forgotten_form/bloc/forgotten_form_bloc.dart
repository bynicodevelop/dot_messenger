import 'package:bloc/bloc.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:equatable/equatable.dart';

part 'forgotten_form_event.dart';
part 'forgotten_form_state.dart';

class ForgottenFormBloc extends Bloc<ForgottenFormEvent, ForgottenFormState> {
  final AuthenticationRepository authenticationRepository;

  ForgottenFormBloc({
    required this.authenticationRepository,
  }) : super(ForgottenFormInitialState()) {
    on<OnForgottenFormEvent>((event, emit) async {
      emit(ForgottenFormLoadingState());

      try {
        await authenticationRepository.forgottenPassword(
          event.email,
        );

        emit(ForgottenFormSuccessState());
      } catch (e) {}
    });
  }
}
