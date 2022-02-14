part of 'google_connect_bloc.dart';

abstract class GoogleConnectState extends Equatable {
  const GoogleConnectState();

  @override
  List<Object> get props => [];
}

class GoogleConnectInitialState extends GoogleConnectState {}

class GoogleConnectLoadingState extends GoogleConnectState {}

class GoogleConnectSuccessState extends GoogleConnectState {}

class GoogleConnectFailureState extends GoogleConnectState {
  final String error;

  const GoogleConnectFailureState({
    required this.error,
  });

  @override
  List<Object> get props => [
        error,
      ];
}
