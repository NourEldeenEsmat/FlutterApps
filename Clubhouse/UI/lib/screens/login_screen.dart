// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ui/screens/main_screen.dart';

import '../components/curve_cliper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[200],
        child: Material(
          color: Colors.grey[200],
          child: Column(
            children: [
              ClipPath(
                clipper: CurveCliper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2.25,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_background.jpg'),
                ),
              ),
              Text(
                'FREEZE',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.blue,
                    letterSpacing: 3),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.password),
                      hintText: 'PassWord'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    color: Colors.blue[800],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          color: Colors.lightBlueAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                      height: 80,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: MaterialButton(
                        height: 50,
                        onPressed: () {},
                        color: Colors.blue[800],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.power_settings_new_outlined,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'not have an account',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
