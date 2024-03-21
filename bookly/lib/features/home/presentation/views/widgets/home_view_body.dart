import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';

import 'list_best_sallry.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      // physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeatueredBookListView(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Newst Books',
                  style: Styles.textStyle20,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: BestList(),
          ),
        ),
      ],
    );
  }
}
