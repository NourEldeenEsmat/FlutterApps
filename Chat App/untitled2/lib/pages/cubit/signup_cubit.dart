import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Future<void> signup(
      {required String? email, required String? password}) async {
    emit(SignupLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(SignupSucsses());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(SignupFaliuer(errormsg: 'ex.code'));
      } else if (ex.code == 'wrong-password') {
        emit(SignupFaliuer(errormsg: 'ex.code'));
      }
    } catch (e) {
      emit(SignupFaliuer(errormsg: 'e.toString()'));
    }
  }
}
