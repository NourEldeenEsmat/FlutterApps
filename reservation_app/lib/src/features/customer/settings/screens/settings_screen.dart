import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          isBack: true,
          title: 'Settings',
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.user,
              color: AppColors.primaryColor,
            ),
            title: const Text('Edit Profile'),
            trailing: const Icon(FontAwesomeIcons.angleRight),
            onTap: () {
              GoRouter.of(context).push('/edit_profile_screen');
            },
          ),
          const Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.solidBell,
              color: AppColors.primaryColor,
            ),
            title: const Text('Notifications'),
            trailing: const Icon(FontAwesomeIcons.angleRight),
            onTap: () {
              GoRouter.of(context).push('/notification_setting_screen');
            },
          ),
          const Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.lock,
              color: AppColors.primaryColor,
            ),
            title: const Text('Change Password'),
            trailing: const Icon(FontAwesomeIcons.angleRight),
            onTap: () {
              GoRouter.of(context).push('/change_password_screen');
            },
          ),
          const Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.fileContract,
              color: AppColors.primaryColor,
            ),
            title: const Text('Terms & Conditions'),
            trailing: const Icon(FontAwesomeIcons.angleRight),
            onTap: () {
              GoRouter.of(context).push('/terms_conditions_screen');
            },
          ),
          const Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.headset,
              color: AppColors.primaryColor,
            ),
            title: const Text('Help & Support'),
            trailing: const Icon(FontAwesomeIcons.angleRight),
            onTap: () {
              GoRouter.of(context).push('/help_support_screen');
            },
          ),
          Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.trash,
              color: Colors.red,
            ),
            title: const Text('Delete Account',
                style: TextStyle(color: Colors.red)),
            trailing: const Icon(FontAwesomeIcons.angleRight),
            onTap: () {},
          ),
          const Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
