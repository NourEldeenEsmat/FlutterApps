import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationSettingScreen> {
  bool isMessageAlert = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          isBack: true,
          title: 'Notifications',
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Message Alert'),
            trailing: Switch(
              value: isMessageAlert,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: AppColors.textColor.withOpacity(0.5),
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  isMessageAlert = value;
                });
              },
            ),
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
