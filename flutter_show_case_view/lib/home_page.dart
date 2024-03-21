import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey add = GlobalKey();
  final GlobalKey item = GlobalKey();
  final GlobalKey icecream = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context).startShowCase([add, item,icecream]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ShowCaseView'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Showcase(
                description: 'icecream',
                key: icecream,
                child: Icon(Icons.icecream),
              ))
        ],
      ),
      floatingActionButton: Showcase(
        key: add,
        description: 'tap to add an item',
        overlayOpacity: .5,
        targetShapeBorder: CircleBorder(),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => index == 4
              ? Showcase(
                  key: item,
                  description: 'tap to see item',
                  child: listItem(index))
              : listItem(index)),
    );
  }

  listItem(int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.apps,
          color: Colors.white,
        ),
      ),
      title: Text('Flutter Title $index'),
      subtitle: Text('flutter subTitle $index'),
      trailing: Text('july 2023'),
    );
  }
}
