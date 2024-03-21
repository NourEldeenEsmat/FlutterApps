import 'package:flutter/cupertino.dart';
import '../models/article_model.dart';
import '../services/news_service.dart';

class ArtListVeiwModel extends  ChangeNotifier {
  List<Article>? _artList = [];
  List<Article>? _artListBycat = [];

  fetchArt() async {
    _artList = (await NewsApi().fetchArticles());
    notifyListeners();
  }

  fetchArtByCat(String cat) async {
    _artListBycat = (await NewsApi().fetchArticlesbyCategory(cat));
    notifyListeners();
  }

  List<Article>? get artListBycat => _artListBycat;

  List<Article>? get artList => _artList;
}
