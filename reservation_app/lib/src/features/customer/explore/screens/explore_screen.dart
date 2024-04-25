import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/explore/providers/explore_provider.dart';
import 'package:reservation_app/src/features/customer/explore/widgets/explore_search_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            title: '',
            isBack: false,
            isHome: false,
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ready to",
                        style: Theme.of(context).textTheme.titleSmall),
                    Text("Reserve your seat?",
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              const ExploreSearchWidget(),
              Expanded(
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      const TabBar(
                        tabs: <Widget>[
                          Tab(
                            text: 'Tables',
                          ),
                          Tab(
                            text: 'Clubs',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: Provider.of<ExploreProvider>(context)
                              .buildTabViews(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
