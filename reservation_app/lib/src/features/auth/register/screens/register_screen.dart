import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_assets.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/constants/app_strings.dart';
import 'package:reservation_app/src/core/utils/app_dialogs.dart';
import 'package:reservation_app/src/core/utils/widgets/input_textfield_widget.dart';
import 'package:reservation_app/src/features/auth/register/providers/register_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                AppAssets.designUpperSvg,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                AppAssets.designLowerSvg,
              ),
            ),
            Consumer<RegisterProvider>(
              builder: (context, registerProvider, child) {
                return Form(
                  key: registerProvider.formKey,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.whiteColor,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              minimumSize: const Size(190, 55),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(65),
                                  bottomLeft: Radius.circular(65),
                                ),
                              ),
                            ),
                            onPressed: () {
                              GoRouter.of(context).go('/login_screen');
                            },
                            child: const Text(AppStrings.loginButton),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            AppStrings.registerTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Column(
                                children: [
                                  CustomTextField(
                                    topRightRadius: 65,
                                    bottomRightRadius: 0,
                                    leadingIcon: const Icon(
                                      CupertinoIcons.person,
                                    ),
                                    hintText: AppStrings.namePlaceholder,
                                    obscureText: false,
                                    controller:
                                        registerProvider.fullNameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextField(
                                    topRightRadius: 0,
                                    bottomRightRadius: 0,
                                    leadingIcon: const Icon(
                                      FontAwesomeIcons.envelope,
                                    ),
                                    hintText: AppStrings.emailPlaceholder,
                                    obscureText: false,
                                    controller:
                                        registerProvider.emailController,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value.contains("@") == false ||
                                          value.contains(".") == false) {
                                        return "";
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextField(
                                    topRightRadius: 0,
                                    bottomRightRadius: 0,
                                    leadingIcon: const Icon(
                                      FontAwesomeIcons.lock,
                                    ),
                                    hintText: AppStrings.passwordPlaceholder,
                                    obscureText: false,
                                    controller:
                                        registerProvider.passwordController,
                                    trailingIcon: const Icon(
                                      FontAwesomeIcons.eye,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return "";
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextField(
                                    topRightRadius: 0,
                                    bottomRightRadius: 65,
                                    leadingIcon: const Icon(
                                      FontAwesomeIcons.lock,
                                    ),
                                    hintText:
                                        AppStrings.confirmPasswordPlaceholder,
                                    obscureText: false,
                                    controller: registerProvider
                                        .confirmPasswordController,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value !=
                                              registerProvider
                                                  .passwordController.text) {
                                        return "";
                                      }
                                      return null;
                                    },
                                    trailingIcon: const Icon(
                                      FontAwesomeIcons.eye,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: MediaQuery.of(context).size.width * 0.22,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return FloatingActionButton(
                                      backgroundColor: AppColors.primaryColor,
                                      foregroundColor: AppColors.whiteColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      onPressed: () async {
                                        if (registerProvider
                                            .formKey.currentState!
                                            .validate()) {
                                          AppDialog.showLoadingDialog(
                                              context, "Registering...");
                                          await registerProvider
                                              .registerUser(context);
                                          GoRouter.of(context)
                                              .go('/complete_profile_screen');
                                        } else {
                                          AppDialog.showErrorDialog(
                                              context,
                                              "Please fill all the fields correctly.",
                                              GoRouter.of(context).pop);
                                        }
                                      },
                                      child: const Icon(Icons.arrow_forward),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: AppColors.textColor.withOpacity(0.5),
                                thickness: 2,
                                endIndent: 10,
                                indent: 20,
                              ),
                            ),
                            const Text(
                              AppStrings.registerUsing,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 16,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.textColor.withOpacity(0.5),
                                thickness: 2,
                                indent: 10,
                                endIndent: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppAssets.googleIcon,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 50),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            AppStrings.privacyPolicy,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
