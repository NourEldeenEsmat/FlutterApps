import 'package:flutter/material.dart';
import 'package:ui/data/data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage('${currentUser.backgroundImageUrl}'),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('${currentUser.profileImageUrl}'),
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Text(
                      '${currentUser.name}',
                      style: TextStyle(
                        color: Colors.orange,
                        backgroundColor: Colors.black.withOpacity(.2),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 25,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 25,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.chat,
              size: 25,
            ),
            title: Text(
              'Chat',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              size: 25,
            ),
            title: Text(
              'Map',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 25,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
