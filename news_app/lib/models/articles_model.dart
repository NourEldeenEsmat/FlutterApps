

class Articles{
  final List<dynamic> articles;
  Articles({required this.articles});
  factory Articles.fromjson(Map<String,dynamic> jsonData)
  {
    return Articles(articles: jsonData['articles']);
  }
}