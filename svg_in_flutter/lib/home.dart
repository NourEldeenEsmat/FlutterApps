import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter SVG'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Load SVG from Assets'),
            Divider(),
            Expanded(child: SvgPicture.asset('assets/football.svg'),),
            Text('Load SVG from Network'),
            Divider(),
            Expanded(
              child: SvgPicture.network(
                'https://freesvg.org/img/1691392087FootballPlayer1b.png',
                placeholderBuilder: (BuildContext context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
