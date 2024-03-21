import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('OTP TectField'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  'Verification',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Enter The Code Sent To Your Number',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '+20 011 550 26156',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                Pinput(
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!
                          .copyWith(border: Border.all(color: Colors.green))),
                  onCompleted: (pin) => debugPrint(pin),
                ),
              ],
            )),
      ),
    );
  }
}
