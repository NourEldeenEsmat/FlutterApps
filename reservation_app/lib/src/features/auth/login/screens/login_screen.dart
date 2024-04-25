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
import '../providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false).initializeControllers();
    super.initState();
  }

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
            Consumer<LoginProvider>(
              builder: (context, loginProvider, child) {
                return Form(
                  key: loginProvider.formKey,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            AppStrings.loginTitle,
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
                                      FontAwesomeIcons.envelope,
                                    ),
                                    hintText: AppStrings.emailPlaceholder,
                                    obscureText: false,
                                    controller: loginProvider.emailController,
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
                                    bottomRightRadius: 65,
                                    leadingIcon: const Icon(
                                      FontAwesomeIcons.lock,
                                    ),
                                    hintText: AppStrings.passwordPlaceholder,
                                    obscureText: false,
                                    controller:
                                        loginProvider.passwordController,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
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
                                right: MediaQuery.of(context).size.width * 0.23,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return FloatingActionButton(
                                      backgroundColor: AppColors.primaryColor,
                                      foregroundColor: AppColors.whiteColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      onPressed: () async {
                                        if (loginProvider.formKey.currentState!
                                            .validate()) {
                                          AppDialog.showLoadingDialog(
                                              context, "Logging in...");
                                          await loginProvider
                                              .loginUser(context);
                                          if (loginProvider
                                                  .userRoleController.text ==
                                              "super_admin") {
                                            GoRouter.of(context)
                                                .go('/super_admin_main_screen');
                                          } else if (loginProvider
                                                  .userRoleController.text ==
                                              "admin") {
                                            GoRouter.of(context)
                                                .go('/admin_main_screen');
                                          } else if (loginProvider
                                                  .userRoleController.text ==
                                              "customer") {
                                            GoRouter.of(context)
                                                .go('/main_screen');
                                          }
                                        } else {
                                          AppDialog.showErrorDialog(context,
                                              "Please enter valid email and password",
                                              () {
                                            Navigator.of(context).pop();
                                          });
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
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              AppStrings.forgotPassword,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
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
                              AppStrings.loginUsing,
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
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
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
                                  topRight: Radius.circular(65),
                                  bottomRight: Radius.circular(65),
                                ),
                              ),
                            ),
                            onPressed: () {
                              GoRouter.of(context).go('/register_screen');
                            },
                            child: const Text(AppStrings.registerButton),
                          ),
                        ),
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
