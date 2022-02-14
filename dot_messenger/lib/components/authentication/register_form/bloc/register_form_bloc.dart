import 'package:bloc/bloc.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:equatable/equatable.dart';

part 'register_form_event.dart';
part 'register_form_state.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final AuthenticationRepository authenticationRepository;

  RegisterFormBloc({
    required this.authenticationRepository,
  }) : super(RegisterFormInitialState()) {
    on<OnRegisterFormEvent>((event, emit) async {
      emit(RegisterFormLoadingState());

      try {
        await authenticationRepository.signUpWithEmailAndPassword(
          event.email,
          event.password,
        );

        emit(RegisterFormSuccessState());
      } catch (e) {
        emit(RegisterFormFailureState(
          error: e.toString(),
        ));
      }
    });
  }
}
