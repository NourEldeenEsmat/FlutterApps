// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String? email, required String? password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(LoginSucsses());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFaliuer(errormsg: 'ex.code'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFaliuer(errormsg: 'ex.code'));
      }
    } catch (e) {
      emit(LoginFaliuer(errormsg: 'e.toString()'));
    }
  }
}
