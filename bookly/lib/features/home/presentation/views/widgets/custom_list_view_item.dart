import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomLisViewItem extends StatelessWidget {
  const CustomLisViewItem({Key? key, required this.picUrl}) : super(key: key);
  final String picUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
            imageUrl: picUrl,
            errorWidget: (context, url, error) =>
                const Icon(Icons.access_alarm),
          )),
    );
  }
}
