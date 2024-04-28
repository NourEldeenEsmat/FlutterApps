import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/src/constants/app_assets.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/constants/app_strings.dart';
import 'package:reservation_app/src/core/utils/widgets/input_textfield_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
                  const SizedBox(height: 10),
                  const Text(
                    AppStrings.otpTitle,
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
                      AppStrings.otpDescription,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor.withOpacity(0.8),
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: 50,
                    filled: true,
                    fillColor: AppColors.primaryColor.withOpacity(0.5),
                    borderColor: AppColors.primaryColor.withOpacity(0.5),
                    enabledBorderColor: Colors.transparent,
                    focusedBorderColor: AppColors.primaryColor,
                    disabledBorderColor: AppColors.primaryColor,
                    showFieldAsBox: true,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    textStyle: const TextStyle(fontSize: 16),
                    onCodeChanged: (String code) {
                      //handle validation
                    },
                    onSubmit: (String verificationCode) {
                      //handle validation
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/reset_password_screen');
                    },
                    child: const Text(
                      AppStrings.optTimer,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                      ),
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
