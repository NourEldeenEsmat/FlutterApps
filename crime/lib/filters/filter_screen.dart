import 'package:crime/consts/crime_types.dart';
import 'package:crime/dash_board/dash_board.dart';
import 'package:flutter/material.dart';

import '../select_crime_types/select_type.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '         Filters',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        leading: IconButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DashBoard()));
        }, icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,),),
      ),
      backgroundColor: Colors.black,
      body: Column(
          children: [
      Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 3,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Crime Type',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TypeSelection()));
            },
            child: Text('small item theft')),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white,
          height: 3,

        )
      ],
    ),),
    SizedBox(height: 30,),
    Row(
    children: [
    SizedBox(width: 20,),
    Text(
    'Time Range',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white),
    ),
    SizedBox(width: 50,),
    Text(
    '11:59 AM-12:00 PM',
    style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white),
    ),
    ],
    ),
    SizedBox(height: 30,),

    ],
    ),
    );
    }
  }
