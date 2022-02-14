import 'package:bloc/bloc.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:equatable/equatable.dart';

part 'facebook_connect_event.dart';
part 'facebook_connect_state.dart';

class FacebookConnectBloc
    extends Bloc<FacebookConnectEvent, FacebookConnectState> {
  final AuthenticationRepository authenticationRepository;

  FacebookConnectBloc({
    required this.authenticationRepository,
  }) : super(FacebookConnectInitialState()) {
    on<OnFacebookConnectEvent>((event, emit) async {
      emit(FacebookConnectLoadingState());

      await authenticationRepository.signInWithFacebook();

      emit(FacebookConnectSuccessState());
    });
  }
}
