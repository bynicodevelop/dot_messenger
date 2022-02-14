import 'package:bloc/bloc.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:equatable/equatable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthenticationRepository authenticationRepository;

  LogoutBloc({
    required this.authenticationRepository,
  }) : super(LogoutInitialState()) {
    on<LogoutEvent>((event, emit) async {
      emit(LogoutLoadingState());

      await authenticationRepository.signOut();

      emit(LogoutSuccessState());
    });
  }
}
