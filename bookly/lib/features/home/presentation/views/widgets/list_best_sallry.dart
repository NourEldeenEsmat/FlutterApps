// ignore_for_file: sort_child_properties_last

import 'package:bookly/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_item.dart';

class BestList extends StatelessWidget {
  const BestList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return SizedBox(
            child: ListView.builder(
              itemCount: state.books.length,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return BestSellerListViewItem(
                  picUrl: state.books[index].volumeInfo.imageLinks.thumbnail,
                  auother: state.books[index].volumeInfo.authors.first,
                  name: state.books[index].volumeInfo.title,
                  rank: state.books[index].volumeInfo.averageRating ?? 0,
                );
              },
            ),
            height: 220,
          );
        } else if (state is NewsetBooksFailure) {
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
