import 'package:dot_messenger/exceptions/authentication_exception.dart';
import 'package:dot_messenger/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final FirebaseAuth authentication;

  const AuthenticationRepository({
    required this.authentication,
  });

  Stream<UserModel> get user {
    return authentication.authStateChanges().map((user) {
      if (user == null) {
        return UserModel.empty();
      }

      return UserModel.fromFirebaseUser(user);
    });
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await authentication.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String code = AuthenticationException.invalidEmail;

      switch (e.code) {
        case "user-disabled":
        case "user-not-found":
        case "wrong-password":
          code = AuthenticationException.badCredentials;
          break;
      }

      throw AuthenticationException(code);
    }
  }

  Future<UserModel?> signInWithGoogle() async {
    throw UnimplementedError();
  }

  Future<UserModel?> signInWithFacebook() async {
    throw UnimplementedError();
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await authentication.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String code = AuthenticationException.emailAlreadyExists;

      switch (e.code) {
        case "invalid-email":
          code = AuthenticationException.invalidEmail;
          break;
        case "weak-password":
          code = AuthenticationException.invalidPassword;
          break;
      }

      throw AuthenticationException(code);
    }
  }

  Future<void> forgottenPassword(String email) async {
    try {
      await authentication.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      throw const AuthenticationException(
        AuthenticationException.invalidEmail,
      );
    }
  }

  Future<void> signOut() async => await authentication.signOut();
}
