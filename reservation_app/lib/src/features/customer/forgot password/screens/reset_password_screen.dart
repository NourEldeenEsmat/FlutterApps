import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/src/constants/app_assets.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/constants/app_strings.dart';
import 'package:reservation_app/src/core/utils/widgets/input_textfield_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                  Lottie.asset(
                    AppAssets.optLottie,
                    height: 240,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    AppStrings.resetPasswordTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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
                              hintText: AppStrings.newPasswordPlaceholder,
                              obscureText: false,
                              controller: TextEditingController(),
                              validator: (value) => null,
                              trailingIcon: const Icon(
                                FontAwesomeIcons.eye,
                              ),
                            ),
                            CustomTextField(
                              topRightRadius: 0,
                              bottomRightRadius: 65,
                              leadingIcon: const Icon(
                                FontAwesomeIcons.lock,
                              ),
                              hintText: AppStrings.confirmPasswordPlaceholder,
                              obscureText: false,
                              controller: TextEditingController(),
                              validator: (value) => null,
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
                                onPressed: () {
                                  GoRouter.of(context).go('/success_screen');
                                },
                                child: const Icon(Icons.arrow_forward),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
