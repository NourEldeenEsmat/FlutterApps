import 'package:flutter/material.dart';
import 'package:ui/models/post_model.dart';

import '../data/data.dart';
import '../models/user_model.dart';

class PostCarosal extends StatelessWidget {
  PageController? pageController;

  PostCarosal({this.pageController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Posts',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 300,
          child: PageView.builder(
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              Post post = posts[index];
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // border: Border.all(
                      //     color: Colors.blue,
                      //     width: 2,
                      //   ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 5,
                        )
                      ],
                      shape: BoxShape.rectangle,
                    ),
                    height: 300,
                    width: 250,
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage('${post.imageUrl}'),
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 10,
                      right: 23,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(.90),
                        ),
                        height: 100,
                      )),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${post.title}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '${post.location}',
                          ),
                          Row(children: [
                            SizedBox(width: 10,),
                            Text(
                              '💙 ${post.likes}',
                            ),
                            SizedBox(width: 130,),
                            Icon(Icons.comment),
                            Text(
                              ' ${post.comments}',
                            ),
                          ],)
                        ],
                      ))
                ],
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );


  }
}
