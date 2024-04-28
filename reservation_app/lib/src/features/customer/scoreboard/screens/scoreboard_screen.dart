import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/scoreboard/providers/scoreboard_provider.dart';

class ScoreboardScreen extends StatefulWidget {
  const ScoreboardScreen({super.key});

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Scoreboard',
          isBack: false,
          isHome: false,
        ),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: <Widget>[
            const TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Global',
                ),
                Tab(
                  text: 'Local',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children:
                    Provider.of<ScoreboardProvider>(context).buildTabViews(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
