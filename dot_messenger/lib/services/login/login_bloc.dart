import 'package:bloc/bloc.dart';
import 'package:dot_messenger/exceptions/authentication_exception.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository authenticationRepository;

  LoginBloc({
    required this.authenticationRepository,
  }) : super(LoginInitialState()) {
    on<OnLoginWithEmailPasswordEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        await authenticationRepository.signInWithEmailAndPassword(
          event.email,
          event.password,
        );

        emit(LoginSuccessState());
      } on AuthenticationException catch (e) {
        emit(LoginFailureState(
          errorMessage: e.toString(),
        ));
      }
    });

    on<OnLogoutEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        await authenticationRepository.signOut();

        emit(LogoutSuccessState());
      } on AuthenticationException catch (e) {
        emit(LoginFailureState(
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
