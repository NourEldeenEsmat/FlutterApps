part of 'login_cubit.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucsses extends LoginState {}

class LoginFaliuer extends LoginState {
  String errormsg;
  LoginFaliuer({required this.errormsg});
}
