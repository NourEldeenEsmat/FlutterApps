import 'package:flutter/material.dart';
import 'package:news_app/view/home.dart';
import 'package:news_app/view_model/artlist_veiw_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
//API:d6dd34da28c3454eb3ae96593c624acf
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArtListVeiwModel>(
        create: (context)=>ArtListVeiwModel(),
        child:MaterialApp(
            title: 'news',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeView())
    );
  }
}
//Scaffold(
//           body: Center(
//             child: GestureDetector(
//               onTap: () async {
//                 NewsApi newsApi = NewsApi();
//                 var articles = await newsApi.fetchArticlesbyCategory('sports');
//                 for (var article in articles!) {
//
//                 }
//               },
//               child: const Text('data'),
//             ),
//           ),
//         ))