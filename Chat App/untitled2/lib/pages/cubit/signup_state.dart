// ignore_for_file: must_be_immutable

part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSucsses extends SignupState {}

class SignupFaliuer extends SignupState {
  String errormsg;
  SignupFaliuer({required this.errormsg});
}
