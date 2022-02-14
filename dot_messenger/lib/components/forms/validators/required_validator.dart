import 'package:formz/formz.dart';

enum RequiredValidationError { invalid }

class RequiredValidator extends FormzInput<String, RequiredValidationError> {
  const RequiredValidator.pure([String value = '']) : super.pure(value);
  const RequiredValidator.dirty([String value = '']) : super.dirty(value);

  @override
  RequiredValidationError? validator(String? value) {
    return (value ?? '').isNotEmpty ? null : RequiredValidationError.invalid;
  }
}
