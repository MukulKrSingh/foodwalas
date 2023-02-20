import 'package:formz/formz.dart';

enum UsernameValidationError {
  empty,
}

class Username extends FormzInput<String, UsernameValidationError> {
  Username.pure() : super.pure('');
  Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    return null;
  }
}
