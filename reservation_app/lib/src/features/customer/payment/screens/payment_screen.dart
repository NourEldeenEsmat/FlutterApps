import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/payment/screens/payment_complete.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            title: 'Payment',
            isBack: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push('/add_card_screen');
                      },
                      child: Container(
                        width: 100,
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.textColor.withOpacity(0.12),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.plus,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push('/edit_card_screen');
                      },
                      child: CreditCardWidget(
                        cardNumber: '4242424242424242',
                        expiryDate: '04/24',
                        isChipVisible: false,
                        isSwipeGestureEnabled: false,
                        width: 150,
                        padding: 5,
                        height: 200,
                        cardBgColor: Colors.black,
                        cardHolderName: 'John Doe',
                        cvvCode: '424',
                        cardType: CardType.mastercard,
                        showBackView: false,
                        onCreditCardWidgetChange:
                            (CreditCardBrand creditCardBrand) {},
                      ),
                    ),
                    CreditCardWidget(
                      cardNumber: '4242424242424242',
                      expiryDate: '04/24',
                      isChipVisible: false,
                      isSwipeGestureEnabled: false,
                      width: 250,
                      padding: 5,
                      height: 200,
                      cardBgColor: Colors.black,
                      cardHolderName: 'John Doe',
                      cvvCode: '424',
                      cardType: CardType.mastercard,
                      showBackView: false,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Details',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Divider(
                      color: AppColors.textColor.withOpacity(0.12),
                      thickness: 2,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Table 5',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'NoHo’s Club',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.textColor.withOpacity(0.5),
                          ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          color: AppColors.primaryColor,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text("Times square, NY"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.textColor.withOpacity(0.12),
                      thickness: 2,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Date',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '20 February 2024 - Wednesday',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Time',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '09:30 PM',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Persons',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '4 Persons',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.textColor.withOpacity(0.12),
                      thickness: 2,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Estimated Cost',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '(Difference included)',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '\$ 50',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.textColor.withOpacity(0.12),
                      thickness: 2,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
              textStyle: Theme.of(context).textTheme.labelMedium,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return const Dialog.fullscreen(
              //       child: PaymentCompleteScreen(),
              //     );
              //   },
              // );
              GoRouter.of(context).push('/payment_complete_screen');
            },
            child: const Text('Confirm'),
          ),
        ),
      ),
    );
  }
}
