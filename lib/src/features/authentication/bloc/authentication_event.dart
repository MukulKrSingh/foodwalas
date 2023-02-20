// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}


// ignore: unused_element
class _AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;
  
  const _AuthenticationStatusChanged(this.status);

}

class AuthenticationLogoutRequested extends AuthenticationEvent {
  
}
