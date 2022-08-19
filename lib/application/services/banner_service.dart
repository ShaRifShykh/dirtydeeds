// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:dirtydeeds/application/models/banner.dart';
import 'package:dirtydeeds/application/storage/local_storage.dart';
import 'package:dirtydeeds/application/storage/storage_keys.dart';
import 'package:flutter/material.dart';

class BannerService extends ChangeNotifier {
  List<Banners> _banners = [];
  List<Banners> get banners => _banners;

  Future getBanners() async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "banners",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _banners = [];

      for (var element in (res.data["data"] as List)) {
        _banners.add(Banners.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
