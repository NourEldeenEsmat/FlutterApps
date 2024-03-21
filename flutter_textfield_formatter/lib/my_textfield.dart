
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.lable, required this.inputType, this.formatter}) : super(key: key);
  final String lable;
  final TextInputType inputType;
  final List<TextInputFormatter>? formatter;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lable),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green
                )
              ),

            ),
            keyboardType: inputType,
            inputFormatters: formatter,
          )
        ],
      ),
    );
  }
}
