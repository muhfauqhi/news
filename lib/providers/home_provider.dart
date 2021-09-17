import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api.dart';

class HomeProvider extends ChangeNotifier {
  APIServices _apiServices = APIServices();

  late List<Article> _articles;

  // get articles => this._articles;

  set articles(List<Article> articles) {
    _apiServices.getHeadline();
    _articles = articles;
    notifyListeners();
  }

  Future<void> refresh() async {
    _articles = await getData();
    print(_articles);
  }

  getData() async {
    return _articles = (await _apiServices.getHeadline() as List)
        .map((e) => Article.fromJson(e))
        .toList();
  }
}
