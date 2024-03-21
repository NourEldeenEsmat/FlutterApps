import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'featured_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody(
      {super.key,
        required this.picUrl,
        required this.name,
        required this.auother,
        required this.rank});
  final String picUrl;
  final String name;
  final String auother;
  final num rank;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.ac_unit)],
        leading: const Icon(Icons.shopping_basket),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 120,
              ),
              Image.network(
                picUrl,
                height: 200,
              ),
            ],
          ),
           Text(name
            ,
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            auother,
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                rank.toString(),
                style: Styles.textStyle20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          backgroundColor: Colors.white),
                      child: Text(
                        'FREE',
                        style: Styles.textStyle16.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  height: 48,
                  width: 120,
                ),
                SizedBox(
                  child: Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          backgroundColor: Colors.deepOrangeAccent),
                      child: Text(
                        'free privation',
                        style: Styles.textStyle16.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  height: 48,
                  width: 120,
                ),
              ],
            ),
          ),
          const Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text('you can see also')
            ],
          ),
          const SizedBox(
            child: FeatueredBookListView(),
            height: 130,
          )
        ],
      ),
    );
  }
}
