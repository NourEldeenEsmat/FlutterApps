import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/profile/providers/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<ProfileProvider>(context, listen: false).init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: CustomAppBar(
              isBack: false,
              isProfile: true,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileProvider.fullName ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.my_location_sharp,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(profileProvider.nationality ?? "",
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/facebook_icon.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(profileProvider.facebookAccount ?? ""),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/instagram_icon.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(profileProvider.instagramAccount ?? ""),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/mail_icon.svg',
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(width: 10),
                        Text(profileProvider.emailAccount ?? "")
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("About",
                            style: Theme.of(context).textTheme.titleSmall),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.penToSquare))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "Vivamus auctor, odio eget tincidunt luctus, "
                      "nibh justo tincidunt odio, nec tincidunt odio odio eget tincidunt luctus.",
                      style: TextStyle(
                        color: AppColors.textColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Divider(
                color: AppColors.textColor.withOpacity(0.5),
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.gear,
                    color: AppColors.primaryColor),
                title: const Text('Settings'),
                onTap: () {
                  GoRouter.of(context).push('/settings_screen');
                },
              ),
              Divider(
                color: AppColors.textColor.withOpacity(0.5),
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: const Icon(
                  FontAwesomeIcons.arrowRightFromBracket,
                  color: Colors.red,
                ),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () {},
              ),
              Divider(
                color: AppColors.textColor.withOpacity(0.5),
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
