import 'package:dot_messenger/exceptions/authentication_exception.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/firebase_auth_mock.dart';
import '../mocks/user_credential_mock.dart';

void main() {
  late FirebaseAuthMock mockFirebaseAuth;
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    mockFirebaseAuth = FirebaseAuthMock();

    authenticationRepository = AuthenticationRepository(
      authentication: mockFirebaseAuth,
    );
  });
  group("Test signInWithEmailAndPassword method", () {
    test("Should signup user with success", () async {
      // ARRANGE
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: "john@domain.tld",
        password: "123456",
      )).thenAnswer((_) => Future.value(UserCredentialMock()));

      AuthenticationRepository authenticationRepository =
          AuthenticationRepository(
        authentication: mockFirebaseAuth,
      );

      // ACT
      // ASSERT
      expect(
        () async => await authenticationRepository.signInWithEmailAndPassword(
          "john@domain.tld",
          "123456",
        ),
        returnsNormally,
      );
    });

    test("Should return a Bad Credential Exception", () async {
      const List<String> error = [
        "user-disabled",
        "user-not-found",
        "wrong-password"
      ];

      for (String item in error) {
        // ARRANGE
        when(mockFirebaseAuth.signInWithEmailAndPassword(
          email: "john@domain.tld",
          password: "123456",
        )).thenThrow(
          FirebaseAuthException(
            code: item,
          ),
        );

        AuthenticationRepository authenticationRepository =
            AuthenticationRepository(
          authentication: mockFirebaseAuth,
        );

        // ACT
        // ASSERT
        expect(
          () async => await authenticationRepository.signInWithEmailAndPassword(
            "john@domain.tld",
            "123456",
          ),
          throwsA(
            predicate(
              (e) =>
                  e is AuthenticationException &&
                  e.message == AuthenticationException.badCredentials,
            ),
          ),
        );
      }
    });
  });

  group("Test signUpWithEmailAndPassword method", () {
    setUp(() {
      mockFirebaseAuth = FirebaseAuthMock();

      authenticationRepository = AuthenticationRepository(
        authentication: mockFirebaseAuth,
      );
    });

    test("Should signup user with success", () async {
      // ARRAGE
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: "john@domain.tld",
        password: "123456",
      )).thenAnswer((_) => Future.value(UserCredentialMock()));

      // ACT
      // ASSERT
      expect(
        () async => await authenticationRepository.signUpWithEmailAndPassword(
          "john@domain.tld",
          "123456",
        ),
        returnsNormally,
      );
    });

    test("Should expect an exception when email already exists", () async {
      // ARRANGE
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: "john@domain.tld",
        password: "123456",
      )).thenThrow(
        FirebaseAuthException(
          code: "email-already-in-use",
        ),
      );

      authenticationRepository = AuthenticationRepository(
        authentication: mockFirebaseAuth,
      );

      // ACT
      // ASSERT
      expect(
        () async => await authenticationRepository.signUpWithEmailAndPassword(
          "john@domain.tld",
          "123456",
        ),
        throwsA(
          predicate(
            (e) =>
                e is AuthenticationException &&
                e.message == AuthenticationException.emailAlreadyExists,
          ),
        ),
      );
    });

    test("Should expect an exception when email is invalid", () async {
      // ARRANGE
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: "john@domain.tld",
        password: "123456",
      )).thenThrow(
        FirebaseAuthException(
          code: "invalid-email",
        ),
      );

      authenticationRepository = AuthenticationRepository(
        authentication: mockFirebaseAuth,
      );

      // AC
      // ASSERT
      expect(
        () => authenticationRepository.signUpWithEmailAndPassword(
          "john@domain.tld",
          "123456",
        ),
        throwsA(
          predicate(
            (e) =>
                e is AuthenticationException &&
                e.message == AuthenticationException.invalidEmail,
          ),
        ),
      );
    });

    test("Should expect an exception when password is invalid", () async {
      // ARRANGE
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: "john@domain.tld",
        password: "123456",
      )).thenThrow(
        FirebaseAuthException(
          code: "weak-password",
        ),
      );

      authenticationRepository = AuthenticationRepository(
        authentication: mockFirebaseAuth,
      );

      // AC
      // ASSERT
      expect(
        () => authenticationRepository.signUpWithEmailAndPassword(
          "john@domain.tld",
          "123456",
        ),
        throwsA(
          predicate(
            (e) =>
                e is AuthenticationException &&
                e.message == AuthenticationException.invalidPassword,
          ),
        ),
      );
    });
  });
}
