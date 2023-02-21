// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:foodwalas/src/mock_data/mock_data.dart';

class AuthenticationServices {
  final String username;
  final String password;

  AuthenticationServices({
    required this.username,
    required this.password,
  });


  //* Login User
  Future<bool> logInUser() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return true;
  }

  //* Logout User
  Future<String> logOutUser() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    return mockLogoutResponse;
  }


  //* SignUp User

  Future<String> signUpUser() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    return mockSignUpUserResponse;
  }


}
