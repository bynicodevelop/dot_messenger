import 'package:bloc/bloc.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:equatable/equatable.dart';

part 'google_connect_event.dart';
part 'google_connect_state.dart';

class GoogleConnectBloc extends Bloc<GoogleConnectEvent, GoogleConnectState> {
  final AuthenticationRepository authenticationRepository;

  GoogleConnectBloc({
    required this.authenticationRepository,
  }) : super(GoogleConnectInitialState()) {
    on<OnGoogleConnectEvent>((event, emit) async {
      emit(GoogleConnectLoadingState());

      emit(GoogleConnectSuccessState());
    });
  }
}
