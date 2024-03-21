import 'package:crime/consts/notification_item.dart';
import 'package:crime/dash_board/dash_board.dart';
import 'package:crime/filters/filter_screen.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Filters()));
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 3,
          ),
          NotificationItem(
              crimeType: 'crimeType', distance: '300 feet', time: 'now'),
          SizedBox(
            height: 5,
          ),
          NotificationItem(
              crimeType: 'crimeType', distance: '300 feet', time: 'now'),
          SizedBox(
            height: 5,
          ),
          NotificationItem(
              crimeType: 'crimeType', distance: '300 feet', time: 'now'),
          SizedBox(
            height: 5,
          ),
          NotificationItem(
              crimeType: 'crimeType', distance: '300 feet', time: 'now'),
          SizedBox(
            height: 5,
          ),
          NotificationItem(
              crimeType: 'crimeType', distance: '300 feet', time: 'now'),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
