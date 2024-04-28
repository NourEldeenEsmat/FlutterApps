import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/src/constants/app_assets.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/constants/app_strings.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(
                    AppAssets.successLottie,
                    height: 200,
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/main_screen');
                    },
                    child: const Text(
                      AppStrings.successTitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      AppStrings.successDescription,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor.withOpacity(0.8),
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
