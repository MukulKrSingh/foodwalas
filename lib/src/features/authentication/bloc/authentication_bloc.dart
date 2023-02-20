import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwalas/packages/authentication_package/lib/authentication_repository.dart';

import '../../../../packages/user_package/barrel/user_repository_barrel.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  //*BLOC    
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<_AuthenticationStatusChanged>((event, emit) async {
      switch (event.status) {
        case AuthenticationStatus.authenticated:
          final user = await _userRepository.getUser();
          user != null
              ? emit(AuthenticationState.authenticated(user))
              : emit(
                  const AuthenticationState.unauthenticated(),
                );
          break;
        case AuthenticationStatus.unauthenticated:
          emit(const AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.unknown:
          emit(const AuthenticationState.unknown());
          break;
      }
    });
    on<AuthenticationLogoutRequested>(
      (event, emit) async {
        debugPrint('Logout');
        await _authenticationRepository.logOut();
      },
    );
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(_AuthenticationStatusChanged(status)),
    );
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }
}
