import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/newset_books_cubit/newset_books_cubit.dart';
import 'best_seller_item.dart';

class SearchRsultsList extends StatelessWidget {
  SearchRsultsList({super.key, required this.bookName});
  String? bookName;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (state is NewsetBooksSuccess) {
                  for (var book in state.books) {
                    if (book.volumeInfo.title == bookName) {
                      return BestSellerListViewItem(
                        picUrl: book.volumeInfo.imageLinks.thumbnail,
                        auother: book.volumeInfo.authors.first,
                        name: book.volumeInfo.title,
                        rank: book.volumeInfo.averageRating ?? 0,
                      );
                    }
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
