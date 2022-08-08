// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:dirtydeeds/application/models/journal.dart';
import 'package:dirtydeeds/application/storage/local_storage.dart';
import 'package:dirtydeeds/application/storage/storage_keys.dart';
import 'package:flutter/material.dart';

class JournalService extends ChangeNotifier {
  List<Journal> _journals = [];
  List<Journal> get journals => _journals;

  Future getJournals() async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "journals",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      _journals = [];

      for (var element in (res.data["data"] as List)) {
        _journals.add(Journal.fromJson(element));
      }

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
