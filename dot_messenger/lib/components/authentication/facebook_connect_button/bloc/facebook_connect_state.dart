part of 'facebook_connect_bloc.dart';

abstract class FacebookConnectState extends Equatable {
  const FacebookConnectState();

  @override
  List<Object> get props => [];
}

class FacebookConnectInitialState extends FacebookConnectState {}

class FacebookConnectLoadingState extends FacebookConnectState {}

class FacebookConnectSuccessState extends FacebookConnectState {}

class FacebookConnectFailureState extends FacebookConnectState {
  final String error;

  const FacebookConnectFailureState(this.error);

  @override
  List<Object> get props => [
        error,
      ];
}
