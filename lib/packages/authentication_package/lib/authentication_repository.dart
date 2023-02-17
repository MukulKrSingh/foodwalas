import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodwalas/packages/user_package/barrel/user_repository_barrel.dart';
import 'package:foodwalas/src/services/api/authentication_services.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  unknown,
}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    //Adds value to  stream
    yield AuthenticationStatus.authenticated;

    //Outputs the whole stream
    yield* _controller.stream;
  }

  Future<User?> logIn({
    required String username,
    required String password,
  }) async {
    try {
      final authService =
          AuthenticationServices(username: username, password: password);

      final Map<String, dynamic> loginResponse;

      loginResponse = await authService.logInUser();
      _controller.add(AuthenticationStatus.authenticated);
      return User.fromMap(loginResponse);
    } catch (e) {
      debugPrint(e.toString());
      _controller.add(AuthenticationStatus.unknown);
      return null;
    }
  } 


  void logOut() async {

    _controller.add(AuthenticationStatus.unauthenticated);
    
  }

  
}
