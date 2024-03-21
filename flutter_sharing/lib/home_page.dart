import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String text = 'flutter.dev';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sharing'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            shareButton('share Text & Link', () {
              Share.share(text);
            }),
            Image.asset('assets/R.png'),
            shareButton('share image', () async {
              final image = await rootBundle.load('assets/R.png');
              final buffer = image.buffer;
              Share.shareXFiles([
                XFile.fromData(
                  buffer.asUint8List(image.offsetInBytes, image.lengthInBytes),
                  name: 'Flutter Logo',
                  mimeType: 'image/png',
                ),
              ], subject: 'Flutter Logo');
            }),
            Image.network(
                'https://simkl.in/fanart/66/6637801a3f7f5db3_medium.jpg'),
            shareButton('share Image from network', () async {
              final url = Uri.parse(
                  'https://simkl.in/fanart/66/6637801a3f7f5db3_medium.jpg');
              final response = await http.get(url);
              Share.shareXFiles([
                XFile.fromData(
                  response.bodyBytes,
                  name: 'Flutter 3',
                  mimeType: 'image/png',
                )
              ], subject: 'Flutter 3');
            })
          ],
        ),
      ),
    );
  }

  shareButton(String title, Function()? onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: onPressed, child: Text(title)),
    );
  }
}
