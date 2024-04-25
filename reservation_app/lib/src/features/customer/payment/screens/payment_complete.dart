import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class PaymentCompleteScreen extends StatefulWidget {
  const PaymentCompleteScreen({super.key});

  @override
  State<PaymentCompleteScreen> createState() => _PaymentCompleteScreenState();
}

class _PaymentCompleteScreenState extends State<PaymentCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          surfaceTintColor: AppColors.scaffoldBackgroundColor,
          backgroundColor: AppColors.scaffoldBackgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.close,
                size: 30, color: AppColors.primaryColor),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: true,
                  fillColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                  onChanged: (bool? value) {},
                ),
                Text(
                  'Payment Completed!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Text(
              'Your reservation is confirmed!',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 340,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.fromBorderSide(BorderSide(
                    color: AppColors.textColor.withOpacity(0.12), width: 2.0)),
                color: AppColors.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Table 5"),
                  const Text("NoHo's Club"),
                  const Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: AppColors.primaryColor,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text("Times square, NY"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(height: 10),
                  Text("Date", style: Theme.of(context).textTheme.bodySmall),
                  Text("12th June 2021",
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Time",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text("09:30 PM",
                              style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        FontAwesomeIcons.solidBell,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("Persons", style: Theme.of(context).textTheme.bodySmall),
                  Text("4 Persons",
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: //join chat button
          Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/chat');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            padding: const EdgeInsets.all(15),
            textStyle: Theme.of(context).textTheme.labelMedium,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // ignore: prefer_const_constructors
          child: Text(
            'Join Chat',
          ),
        ),
      ),
    );
  }
}
