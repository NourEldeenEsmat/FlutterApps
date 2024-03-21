import 'package:flutter/material.dart';

class CrimeType extends StatelessWidget {
   CrimeType({Key? key, required this.text, required this.icon, required this.color}) : super(key: key);
 final String text;
 final IconData icon;
 final Color color;
 // late Color myColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
            Text(
              '$text',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
        ],
      ),
    );
  }
}
