import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:dirtydeeds/application/storage/local_storage.dart';
import 'package:dirtydeeds/application/storage/storage_keys.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:flutter/material.dart';

class CommentService extends ChangeNotifier {
  Future addVideoComment({
    required BuildContext context,
    required String comment,
    required int videoId,
  }) async {
    try {
      String? token = LocalStorage.getItem(TOKEN);

      var res = await DirtyDeedsApi.dio.post(
        "add-comment",
        data: {
          "comment": comment,
          "videoId": videoId,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      return res.data["comment"];
    } on DioError catch (e) {
      Common().bottomError(
        context,
        e.response!.data["errors"].toString(),
      );
    }
  }

  Future addArticleComment({
    required BuildContext context,
    required String comment,
    required int articleId,
  }) async {
    try {
      String? token = LocalStorage.getItem(TOKEN);

      var res = await DirtyDeedsApi.dio.post(
        "add-comment",
        data: {
          "comment": comment,
          "articleId": articleId,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      return res.data["comment"];
    } on DioError catch (e) {
      Common().bottomError(
        context,
        e.response!.data["errors"].toString(),
      );
    }
  }
}
