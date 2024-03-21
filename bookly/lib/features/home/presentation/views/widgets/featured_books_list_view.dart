import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view_item.dart';

class FeatueredBookListView extends StatelessWidget {
  const FeatueredBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CustomLisViewItem(
                      picUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    );
                  }));
        } else if (state is FeaturedBooksFailure) {
          return const Text(
            'error',
            style: TextStyle(fontSize: 30),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
