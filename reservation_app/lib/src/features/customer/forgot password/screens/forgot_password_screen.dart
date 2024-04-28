import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/src/constants/app_assets.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/constants/app_strings.dart';
import 'package:reservation_app/src/core/utils/widgets/input_textfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                    AppAssets.forgotPasswordLottie,
                    height: 240,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    AppStrings.forgotPasswordTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      AppStrings.forgotPasswordDescription,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor.withOpacity(0.8),
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 60,
                              child: CustomTextField(
                                topRightRadius: 65,
                                bottomRightRadius: 65,
                                leadingIcon: const Icon(
                                  FontAwesomeIcons.envelope,
                                ),
                                hintText: AppStrings.emailPlaceholder,
                                obscureText: false,
                                controller: TextEditingController(),
                                validator: (value) => null,
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
                                  GoRouter.of(context).go('/otp_screen');
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
