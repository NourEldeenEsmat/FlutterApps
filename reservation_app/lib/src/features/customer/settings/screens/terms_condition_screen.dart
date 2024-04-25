import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(
          isBack: true,
          title: 'Terms & Conditions',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms & Conditions',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore "
                "et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"
                " ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum"
                " dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa "
                "qui officia deserunt mollit anim id est laborum. "),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text(
                  'I agree to all Terms & Conditions',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
