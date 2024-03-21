import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../manger/newset_books_cubit/newset_books_cubit.dart';
import 'best_seller_item.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchByName = TextEditingController();
  @override
  // String? name;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: searchByName,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white)),
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 22,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
                  builder: (context, state) {
                    if (state is NewsetBooksSuccess) {
                      return ListView.builder(
                        itemCount: 9,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          print(state.books[index].volumeInfo.title);
                          if (state.books[index].volumeInfo.title
                              .contains(searchByName.text)) {
                            return BestSellerListViewItem(
                              picUrl: state
                                  .books[index].volumeInfo.imageLinks.thumbnail,
                              auother:
                                  state.books[index].volumeInfo.authors.first,
                              name: state.books[index].volumeInfo.title,
                              rank:
                                  state.books[index].volumeInfo.averageRating ??
                                      0,
                            );
                          }
                        },
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
