// ignore_for_file: non_constant_identifier_names

import 'package:bookly/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {});
    });

    Future.delayed(
      const Duration(seconds: 5),
      () {
        //   Get.to(()=> const HomeView(),transition: Transition.fade,duration: KTranstionDuration);
        GoRouter.of(context).push('/homeView');
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(logoPath),
        const SizedBox(
          height: 15,
        ),
        SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Read Free Books',
            style: TextStyle(fontSize: 20, inherit: false),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
