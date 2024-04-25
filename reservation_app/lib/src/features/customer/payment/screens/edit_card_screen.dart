import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/payment/providers/add_card_provider.dart';
import 'package:reservation_app/src/features/customer/payment/widgets/card_input_field_widget.dart';

class EditCardScreen extends StatefulWidget {
  const EditCardScreen({super.key});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Edit Card',
          isBack: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, AddCardProvider addCardProvider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                children: [
                  CreditCardWidget(
                    cardNumber: addCardProvider.cardNumber,
                    expiryDate: addCardProvider.expiryDate,
                    cardHolderName: addCardProvider.cardHolderName,
                    cardBgColor: Colors.black,
                    cvvCode: addCardProvider.cvvCode,
                    cardType: CardType.mastercard,
                    showBackView: addCardProvider.isCvvFocused,
                    obscureCardNumber: false,
                    obscureCardCvv: true,
                    padding: 0,
                    height: 200,
                    isChipVisible: false,
                    width: MediaQuery.of(context).size.width,
                    animationDuration: const Duration(milliseconds: 1000),
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                  ),
                  const SizedBox(height: 20),
                  Form(
                    child: Column(
                      children: [
                        CardInputFieldWidget(
                          controller: addCardProvider.cardHolderNameController,
                          updateValue: addCardProvider.updateCardHolderName,
                          labelText: 'Card Holder Name',
                          hintText: 'John Doe',
                        ),
                        const SizedBox(height: 20),
                        CardInputFieldWidget(
                          controller: addCardProvider.cardNumberController,
                          updateValue: addCardProvider.updateCardNumber,
                          labelText: 'Card Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CardInputFieldWidget(
                                controller:
                                    addCardProvider.expiryDateController,
                                updateValue: addCardProvider.updateExpiryDate,
                                labelText: 'Expiry Date',
                                hintText: 'MM/YY',
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CardInputFieldWidget(
                                controller: addCardProvider.cvvCodeController,
                                updateValue: addCardProvider.updateCvvCode,
                                labelText: 'CVV',
                                hintText: 'XXX',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Divider(
                    color: AppColors.textColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        'Delete Card',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.red,
                                ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.textColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.whiteColor,
                ),
            minimumSize: const Size(double.infinity, 60),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ),
    );
  }
}
