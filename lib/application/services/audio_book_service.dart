// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:dirtydeeds/application/models/audio_book.dart';
import 'package:dirtydeeds/application/storage/local_storage.dart';
import 'package:dirtydeeds/application/storage/storage_keys.dart';
import 'package:flutter/material.dart';

class AudioBookService extends ChangeNotifier {
  List<AudioBook> _audioBooks = [];
  List<AudioBook> get audioBooks => _audioBooks;

  Future getAudioBooks() async {
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

      _audioBooks = [];

      for (var element in (res.data["data"] as List)) {
        _audioBooks.add(AudioBook.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
