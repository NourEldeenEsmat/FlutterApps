import 'package:bookly/core/consts.dart';
import 'package:bookly/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: KPColor),
      debugShowCheckedModeBanner: false,
      home: const SplashViewBody(),
    );
  }
}
