part of 'facebook_connect_bloc.dart';

abstract class FacebookConnectEvent extends Equatable {
  const FacebookConnectEvent();

  @override
  List<Object> get props => [];
}

class OnFacebookConnectEvent extends FacebookConnectEvent {}
