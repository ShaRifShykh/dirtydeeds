// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:dirtydeeds/application/models/audio_book.dart';
import 'package:dirtydeeds/application/storage/local_storage.dart';
import 'package:dirtydeeds/application/storage/storage_keys.dart';
import 'package:flutter/material.dart';

class AudioBookService extends ChangeNotifier {
  List<AudioBook> _popularAudioBooks = [];
  List<AudioBook> get popularAudioBooks => _popularAudioBooks;

  List<AudioBook> _recommendedAudioBooks = [];
  List<AudioBook> get recommendedAudioBooks => _recommendedAudioBooks;

  List<AudioBook> _searchAudioBooks = [];
  List<AudioBook> get searchAudioBooks => _searchAudioBooks;

  Future getRecommendedAudioBooks() async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "audio-books",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _recommendedAudioBooks = [];

      for (var element in (res.data["data"] as List)) {
        _recommendedAudioBooks.add(AudioBook.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future getPopularAudioBooks() async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "audio-books",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _popularAudioBooks = [];

      for (var element in (res.data["data"] as List)) {
        _popularAudioBooks.add(AudioBook.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future getSearchAudioBooks({required String query}) async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "audio-books/$query",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _searchAudioBooks = [];

      for (var element in (res.data["data"] as List)) {
        _searchAudioBooks.add(AudioBook.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
