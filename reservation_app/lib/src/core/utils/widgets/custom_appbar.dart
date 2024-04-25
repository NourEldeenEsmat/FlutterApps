import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/app_dialogs.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    required this.isBack,
    this.title,
    this.isHome,
    this.isProfile,
    this.isAdminHome,
    this.isTableScreen,
  }) : super(key: key);

  final bool isBack;
  final String? title;
  final bool? isHome;
  final bool? isProfile;
  final bool? isAdminHome;
  final bool? isTableScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: AppBar(
        backgroundColor: AppColors.canvasColor,
        centerTitle: true,
        surfaceTintColor: AppColors.canvasColor,
        leading: isBack
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  FontAwesomeIcons.angleLeft,
                  color: AppColors.primaryColor,
                ),
              )
            : null,
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.titleMedium,
              )
            : null,
        elevation: 0,
        actions: [
          if (isHome == true)
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.solidBell,
                      color: AppColors.canvasColor,
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.question,
                      color: AppColors.canvasColor,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () async {
                    AppDialog.showLogoutDialog(
                        context, 'Logout', 'Are you sure you want to logout?');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: AppColors.canvasColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          else if (isProfile == true)
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.solidCalendar,
                      color: AppColors.canvasColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          else if (isAdminHome == true)
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/chat_icon.svg',
                      color: AppColors.whiteColor,
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.user,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          else if (isTableScreen == true)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/table_presets_screen');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.table_bar,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
