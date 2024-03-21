import 'package:crime/notifications/notifications_screen.dart';
import 'package:crime/select_crime_types/select_type.dart';
import 'package:flutter/material.dart';

import 'dash_board/dash_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Notifications(),
    );
  }
}
