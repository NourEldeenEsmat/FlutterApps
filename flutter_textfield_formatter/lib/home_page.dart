import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_textfield_formatter/my_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi TextFiled Formatter'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            MyTextField(
                lable: 'Phone number',
                inputType: TextInputType.phone,
                formatter: [
                  PhoneInputFormatter(
                    allowEndlessPhone: false,
                    defaultCountryCode: 'us',
                  )
                ]),
            MyTextField(
                lable: 'Credit Card Number',
                inputType: TextInputType.number,
                formatter: [
                  CreditCardNumberInputFormatter(),
                ]),
            MyTextField(
                lable: 'Amount',
                inputType: TextInputType.numberWithOptions(decimal: true),
                formatter: [
                  CurrencyInputFormatter(
                    leadingSymbol: CurrencySymbols.DOLLAR_SIGN
                  ),
                ]),
            MyTextField(
                lable: 'Invoice Number',
                inputType: TextInputType.number,
                formatter: [
                  MaskedInputFormatter(
                    'IN-###-###'
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
