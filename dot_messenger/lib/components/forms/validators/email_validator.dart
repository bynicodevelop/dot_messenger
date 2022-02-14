import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum EmailValidationError { invalid }

class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure([String value = '']) : super.pure(value);
  const EmailValidator.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return isEmail(value ?? '') ? null : EmailValidationError.invalid;
  }
}
