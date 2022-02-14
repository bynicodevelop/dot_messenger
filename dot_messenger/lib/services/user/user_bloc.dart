import 'package:bloc/bloc.dart';
import 'package:dot_messenger/models/user_model.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthenticationRepository authenticationRepository;

  UserBloc({
    required this.authenticationRepository,
  }) : super(UserInitialState()) {
    authenticationRepository.user.listen((UserModel userModel) {
      add(OnUserLoaded(
        userModel: userModel,
      ));
    });

    on<OnUserLoaded>((event, emit) {
      emit(UserLoadedState(
        user: event.userModel,
      ));
    });
  }
}
