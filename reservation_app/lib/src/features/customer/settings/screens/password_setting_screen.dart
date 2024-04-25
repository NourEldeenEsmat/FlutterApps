import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';

class PasswordSettingScreen extends StatefulWidget {
  const PasswordSettingScreen({super.key});

  @override
  State<PasswordSettingScreen> createState() => _PasswordSettingScreenState();
}

class _PasswordSettingScreenState extends State<PasswordSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            isBack: true,
            title: 'Change Password',
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text("Enter Old Password",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.primaryColor,
                                  )),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.penToSquare,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      hintText: '********',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Enter New Password",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.primaryColor,
                                  )),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.penToSquare,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      hintText: '********',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Confirm New Password",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.primaryColor,
                                  )),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.penToSquare,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      hintText: '********',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
              textStyle: Theme.of(context).textTheme.labelMedium,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Save'),
          ),
        ),
      ),
    );
  }
}
