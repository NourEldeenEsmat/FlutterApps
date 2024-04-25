import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          isBack: true,
          title: 'Help & Support',
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: AppColors.primaryColor,
            ),
            title: const Text('Report a Problem'),
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
              FontAwesomeIcons.handshakeAngle,
              color: AppColors.primaryColor,
            ),
            title: const Text('Help Centre'),
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
            title: const Text('Privacy & Security Help'),
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
