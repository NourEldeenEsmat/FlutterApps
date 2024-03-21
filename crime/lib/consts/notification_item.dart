import 'package:flutter/material.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.crimeType, required this.distance, required this.time}) : super(key: key);
  final String crimeType;
  final String distance;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.grey[800],
      child: Row(
        children: [
          SizedBox(width: 15,),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            child: Icon(Icons.warning_amber,color: Colors.red,),
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              Text(crimeType,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
              SizedBox(height: 10,),
              Text(distance,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w100,color: Colors.red),)
            ],
          ),
          SizedBox(width: 80,),
          Text(time,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.grey),)
        ],
      ),
    );
  }
}
