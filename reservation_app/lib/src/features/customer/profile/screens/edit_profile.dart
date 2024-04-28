import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/profile/providers/profile_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    Provider.of<ProfileProvider>(context, listen: false).getProfileImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          isBack: true,
          title: 'Edit Profile',
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                // CircleAvatar(
                //   radius: 55,
                //   // backgroundImage:
                //   //     ImageAsset('assets/images/profile_picture.png').image,
                // ),
                Center(
                  child:
                      Provider.of<ProfileProvider>(context).imageUrl.isNotEmpty
                          ? Image.memory(
                              base64Decode(Provider.of<ProfileProvider>(context)
                                  .imageUrl
                                  .split(',')
                                  .last),
                              width: 200,
                              height: 200,
                            )
                          : CircularProgressIndicator(),
                ),
                //upload profile picture
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () async {
                      //pick image
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.camera,
                        color: AppColors.whiteColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //name
            Column(
              children: [
                Row(
                  children: [
                    Text("Full Name",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    hintText: 'Maheen',
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),

            //email address
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Text("Email Address",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    hintText: 'james_Stone0@gmail.com',
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Text("Nationality",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    hintText: 'American',
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Text("Phone Number",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    hintText: '+1 123 456 7890',
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.whiteColor,
                textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.whiteColor,
                    ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Save'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: AppColors.canvasColor,
                foregroundColor: AppColors.textColor.withOpacity(0.5),
                textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.textColor.withOpacity(0.5),
                    ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
