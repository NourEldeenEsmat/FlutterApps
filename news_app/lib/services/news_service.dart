import 'dart:convert';
import 'dart:io';
import '../models/articles_model.dart';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final String apiKey = 'd6dd34da28c3454eb3ae96593c624acf';

  Future<List<Article>?> fetchArticles() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?category=sports&country=us&apiKey=$apiKey'));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromjson(jsonData);
        List<Article> artList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return artList;
      } else {
        print('statusCode = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
  Future<List<Article>?> fetchArticlesbyCategory(String category) async {
    try {
      http.Response response = await http.post(Uri.parse(
          'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey'));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromjson(jsonData);
        List<Article> artList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return artList;
      } else {
        print('statusCode = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
    return null;
  }
}
// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//   }
// }