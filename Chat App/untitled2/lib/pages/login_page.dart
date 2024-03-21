// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled2/pages/resgister_page.dart';

import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'chat_page.dart';
import 'cubit/chat_cubit.dart';
import 'cubitLogin/login_cubit.dart';

class LoginPage extends StatelessWidget {
  bool isLoading = false;
  static String id = 'login page';

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucsses) {
          Navigator.pushNamed(context, ChatPage.id);
          BlocProvider.of<ChatCubit>(context).getMessage();
          isLoading = false;
        } else if (state is LoginFaliuer) {
          isLoading = false;
          showSnackBar(context, state.errormsg);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 100,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Scholar Chat',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: 'pacifico',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    const Row(
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormTextField(
                      obscureText: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButon(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .loginUser(email: email, password: password);
                        } else {}
                      },
                      text: 'LOGIN',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'dont\'t have an account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterPage.id);
                          },
                          child: const Text(
                            '  Register',
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// isLoading = true;
//                           // setState(() {});
//                           try {
//                             await loginUser();
//                             Navigator.pushNamed(context, ChatPage.id,
//                                 arguments: email);
//                           } on FirebaseAuthException catch (ex) {
//                             if (ex.code == 'user-not-found') {
//                               showSnackBar(context, 'user not found');
//                             } else if (ex.code == 'wrong-password') {
//                               showSnackBar(context, 'wrong password');
//                             }
//                           } catch (ex) {
//                             print(ex);
//                             showSnackBar(context, 'there was an error');
//                           }

//                           isLoading = false;
//                           // setState(() {});