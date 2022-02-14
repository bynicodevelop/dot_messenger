part of 'google_connect_bloc.dart';

abstract class GoogleConnectEvent extends Equatable {
  const GoogleConnectEvent();

  @override
  List<Object> get props => [];
}

class OnGoogleConnectEvent extends GoogleConnectEvent {}
