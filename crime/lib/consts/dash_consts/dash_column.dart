import 'package:flutter/material.dart';

class DashColumn extends StatelessWidget {
  DashColumn({Key? key, required this.h1, required this.h2, required this.h3, required this.text,}) : super(key: key);
  final double h1,h2,h3;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          // margin: EdgeInsets.symmetric(vertical: 10),
          height: h1,
          width: 20,
          color: Colors.blue[100],
        ),
        Container(
          // margin: EdgeInsets.symmetric(vertical: 10),
          height: h2,
          width: 20,
          color: Colors.blue[300],
        ),
        Container(
          height: h3,
          width: 20,
          color: Colors.red[300],
        ),
        SizedBox(height: 2,),
        Text(text,style: TextStyle(fontSize: 7,color: Colors.white),),
      ],
    );
  }
}
