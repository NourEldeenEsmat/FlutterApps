import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key, required this.text1, required this.text2, required this.Bcolor})
      : super(key: key);
  final String text1;
  final String text2;
  final Color Bcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.white),
        // padding: EdgeInsets.all(25),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.black),
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'reported by',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white70),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'jon doe',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Islamabad, Pakistan',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        text2,
                        style: TextStyle(color: Bcolor),
                      ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '⨅ 02/02/2023',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white70),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '⨀ 10:00',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white70),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                ],
              )
            ],
          ),
        ));
  }
}
