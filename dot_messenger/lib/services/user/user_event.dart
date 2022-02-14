part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class OnUserLoaded extends UserEvent {
  final UserModel userModel;

  const OnUserLoaded({
    required this.userModel,
  });

  @override
  List<Object> get props => [
        userModel,
      ];
}
