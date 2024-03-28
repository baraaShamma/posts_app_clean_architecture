part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}
class ClickButtonLoginEvent extends LoginEvent {
  final Login login;

  const ClickButtonLoginEvent({required this.login});

  @override
  List<Object> get props => [login];
}
