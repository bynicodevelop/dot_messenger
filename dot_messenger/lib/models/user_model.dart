import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  final String? uid;
  final String? displayName;
  final String? email;

  const UserModel({
    this.uid,
    this.displayName,
    this.email,
  });

  bool get isEmpty => uid == null && displayName == null && email == null;

  static UserModel empty() => const UserModel(
        uid: null,
        displayName: null,
        email: null,
      );

  static UserModel fromFirebaseUser(User user) => UserModel(
        uid: user.uid,
        displayName: user.displayName,
        email: user.email,
      );

  static UserModel formJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] as String?,
        displayName: json['displayName'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': uid,
        'displayName': displayName,
        'email': email,
      };

  @override
  List<Object?> get props => [];
}
