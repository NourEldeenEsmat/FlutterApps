import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int percent = 10;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 100,
                percent: percent / 100,
                animation: true,
                lineWidth: 15,
                animateFromLastPercent: true,
                center: Text('$percent %'),
                progressColor: Colors.cyan,
              ),
              LinearPercentIndicator(
                percent: percent / 100,
                animation: true,
                animateFromLastPercent: true,
                center: Text('$percent %'),
                progressColor: Colors.cyan,
                lineHeight: 20,
                barRadius: Radius.circular(30),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (percent >= 100) {
                      setState(() {
                        percent = 10;
                      });
                    }
                    else{
                      setState(() {
                        percent += 10;
                      });                    }
                  },
                  child: Text('press to add 10%'))
            ],
          ),
        ));
  }
}
