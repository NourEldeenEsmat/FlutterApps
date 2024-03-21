import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Url Launcher'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            launcherButton(
                title: 'Launch phone number',
                icon: Icons.phone,
                onPressed: () async {
                  Uri uri = Uri.parse('tel:01155026156');
                  if(!await launcher.launchUrl(uri)){
                    debugPrint('');
                  }
                }),launcherButton(
                title: 'Launch flutter website',
                icon: Icons.online_prediction,
                onPressed: () {
                  Uri uri = Uri.parse('https://flutter.dev');
                  launcher.LaunchMode.externalApplication;
                  launcher.launchUrl(uri);
                }),launcherButton(
                title: 'Launch sms number',
                icon: Icons.sms,
                onPressed: () async {
                  Uri uri = Uri.parse('sms:01155026156');
                  if(!await launcher.launchUrl(uri)){
                    debugPrint('');
                  }
                }),launcherButton(
                title: 'Launch sms number',
                icon: Icons.mail,
                onPressed: () async {
                  Uri uri = Uri.parse('mailto:nouresmat.168@gmail.com');
                  if(!await launcher.launchUrl(uri)){
                    debugPrint('');
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget launcherButton(
      {required String title,
      required IconData icon,
      required Function() onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [Icon(icon), Text(title)],
        ),
      ),
    );
  }
}
