import 'dart:async';

import 'package:flutter/material.dart';
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
    //debugPrint(status.last.toString());
    yield AuthenticationStatus.unauthenticated;

    //Outputs the whole stream
    yield* _controller.stream;
  }

  Future<bool> logIn({
    required String username,
    required String password,
  }) async {
    try {
      final authService =
          AuthenticationServices(username: username, password: password);

      final bool loginResponse;
      //print('auth  added');
      loginResponse = await authService.logInUser();
      _controller.add(AuthenticationStatus.authenticated);
      return loginResponse;
    } catch (e) {
      debugPrint(e.toString());
      _controller.add(AuthenticationStatus.unknown);
      return false;
    }
  }

  Future<void> logOut() async {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }
}
