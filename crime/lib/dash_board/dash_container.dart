import 'package:flutter/material.dart';

import '../consts/dash_consts/dash_column.dart';


class DashContainer extends StatelessWidget {
  const DashContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 6),
      height: 270,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white

      ),
      // padding: EdgeInsets.all(25),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
        height: 265,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.black

        ),
        padding: EdgeInsets.all(20),
        child:  Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('250',style: TextStyle(fontSize: 10,inherit: false),),
                    SizedBox(height: 10,),Text('200',style: TextStyle(fontSize: 10,inherit: false),),
                    SizedBox(height: 10,),Text('150',style: TextStyle(fontSize: 10,inherit: false),),
                    SizedBox(height: 10,),Text('100',style: TextStyle(fontSize: 10,inherit: false),),
                    SizedBox(height: 10,),Text('50',style: TextStyle(fontSize: 10,inherit: false),),
                    SizedBox(height: 10,),Text('20',style: TextStyle(fontSize: 10,inherit: false),),
                    SizedBox(height: 10,),Text('0',style: TextStyle(fontSize: 10,inherit: false),),
                    SizedBox(height: 10,),

                  ],
                ),
                SizedBox(width: 10,),
                DashColumn(h1: 30, h2: 15, h3: 10,text: 'jan 20',),SizedBox(width: 10,),
                DashColumn(h1: 30, h2: 15, h3: 10,text: 'jan 20',),SizedBox(width: 10,),
                DashColumn(h1: 30, h2: 15, h3: 10,text: 'jan 20',),SizedBox(width: 10,),
                DashColumn(h1: 30, h2: 15, h3: 10,text: 'jan 20',),SizedBox(width: 10,),
                DashColumn(h1: 30, h2: 15, h3: 10,text: 'jan 20',),SizedBox(width: 10,),
                DashColumn(h1: 30, h2: 15, h3: 10,text: 'jan 20',),SizedBox(width: 10,),
                DashColumn(h1: 30, h2: 15, h3: 10,text: 'jan 20',),SizedBox(width: 10,),
                DashColumn(h1: 30, h2: 15, h3: 10,text: 'jan 20',),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red[300],
                  radius: 5,
                ),
                SizedBox(width: 5,),
                Text('Damage to property',style: TextStyle(fontSize: 10,color: Colors.white),),
                SizedBox(width: 80,),
                CircleAvatar(
                  backgroundColor: Colors.blue[300],
                  radius: 5,
                ),
                SizedBox(width: 5,),
                Text('Small item theft',style: TextStyle(fontSize: 10,color: Colors.white),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  radius: 5,
                ),
                SizedBox(width: 5,),
                Text('Traffic Complaint',style: TextStyle(fontSize: 10,color: Colors.white),),
                SizedBox(width: 5,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
