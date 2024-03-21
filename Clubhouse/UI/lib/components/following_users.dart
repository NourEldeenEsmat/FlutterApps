import 'package:flutter/material.dart';
import 'package:ui/data/data.dart';

import '../models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Following',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 70,
            child: ListView.builder(
              padding: EdgeInsets.only(left:10),
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user=users[index];
                return Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  height: 60,
                  width: 60,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(
                        '${user.profileImageUrl}'
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
