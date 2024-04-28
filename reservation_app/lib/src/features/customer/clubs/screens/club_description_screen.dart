import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class ClubDescriptionScreen extends StatefulWidget {
  const ClubDescriptionScreen({super.key});
  @override
  State<ClubDescriptionScreen> createState() => _ClubDescriptionScreenState();
}

class _ClubDescriptionScreenState extends State<ClubDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(65),
                    ),
                    child: Image.asset(
                      'assets/images/restaurant.jpg',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "NoHo’s Club",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'American Club',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.textColor.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Times square, NY',
                          style: TextStyle(
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Details',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(
                        color: AppColors.textColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                  textStyle: Theme.of(context).textTheme.labelMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Show Available Tables'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.textColor.withOpacity(0.5),
                    width: 1,
                  ),
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.textColor.withOpacity(0.5),
                  textStyle: Theme.of(context).textTheme.labelMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Request Table'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
