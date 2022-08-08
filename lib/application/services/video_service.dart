// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:dirtydeeds/application/models/video.dart';
import 'package:dirtydeeds/application/storage/local_storage.dart';
import 'package:dirtydeeds/application/storage/storage_keys.dart';
import 'package:flutter/material.dart';

class VideoService extends ChangeNotifier {
  List<Video> _videos = [];
  List<Video> get videos => _videos;

  Future getVideos() async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "videos",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _videos = [];

      for (var element in (res.data["data"] as List)) {
        _videos.add(Video.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
