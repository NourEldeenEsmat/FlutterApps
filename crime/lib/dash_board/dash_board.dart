import 'package:crime/consts/crime_report_card.dart';
import 'package:crime/consts/dash_consts/dash_column.dart';
import 'package:crime/dash_board/dash_container.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),

      body:ListView(
        children: [
          DashContainer(),
          Row(
            children: [
              SizedBox(width: 20,),
              Text('Crime Reported',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),),
              SizedBox(width: 20,),
              TextButton(onPressed: (){}, child: Text('View all',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),))
            ],
          ),
          ReportCard(text1: 'Smale item theft',text2: 'in progress',Bcolor: Colors.blue,),
          ReportCard(text1: 'Vehicle collision',text2: 'Resolved',Bcolor: Colors.green,),
          ReportCard(text1: 'Smale item theft',text2: 'pending',Bcolor: Colors.red,),
          ReportCard(text1: 'Smale item theft',text2: 'in progress',Bcolor: Colors.blue,),
        ],
      )

    );
  }
}
