// ignore_for_file: sort_child_properties_last
import 'package:go_router/go_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'book_details_view_body.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key,
    required this.picUrl,
    required this.name,
    required this.auother,
    required this.rank});

  final String picUrl;
  final String name;
  final String auother;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push('/BookView');
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                BookDetailsViewBody(
                  picUrl: picUrl, name: name, auother: auother, rank: rank,)));
      },
      child: SizedBox(
        // width: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(picUrl),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 100,
                  child: Text(
                    name,
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: Text(
                    auother,
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'free',
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      '⭐ $rank',
                      style: Styles.textStyle20,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        height: 200,
      ),
    );
  }
}
