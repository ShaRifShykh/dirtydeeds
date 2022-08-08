// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:dirtydeeds/application/models/article.dart';
import 'package:dirtydeeds/application/storage/local_storage.dart';
import 'package:dirtydeeds/application/storage/storage_keys.dart';
import 'package:flutter/material.dart';

class ArticleService extends ChangeNotifier {
  List<Article> _articles = [];
  List<Article> get articles => _articles;

  List<Article> _searchArticles = [];
  List<Article> get searchArticles => _searchArticles;

  List<Article> _categoryArticles = [];
  List<Article> get categoryArticles => _categoryArticles;

  Future getArticles() async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "articles",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _articles = [];

      for (var element in (res.data["data"] as List)) {
        _articles.add(Article.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future getSearchArticles({required String query}) async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "article/$query",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _searchArticles = [];

      for (var element in (res.data["data"] as List)) {
        _searchArticles.add(Article.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future getArticlesByCategory({required String category}) async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "article/$category",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _categoryArticles = [];

      for (var element in (res.data["data"] as List)) {
        _categoryArticles.add(Article.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
