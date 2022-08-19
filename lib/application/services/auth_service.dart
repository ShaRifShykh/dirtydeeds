// ignore_for_file: avoid_print
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:dirtydeeds/application/models/user.dart';
import 'package:dirtydeeds/application/storage/local_storage.dart';
import 'package:dirtydeeds/application/storage/storage_keys.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  User? user;
  bool isLoading = false;

  Future signIn({
    required BuildContext context,
    required String phoneNumberOrEmail,
    required String password,
  }) async {
    try {
      isLoading = true;
      var res = await DirtyDeedsApi.dio.post("auth/sign-in", data: {
        "phoneNumberOrEmail": phoneNumberOrEmail,
        "password": password,
      });

      String accessToken = res.data["accessToken"];

      await LocalStorage.setItem(TOKEN, accessToken);

      isLoading = false;
      notifyListeners();

      return accessToken;
    } on DioError catch (e) {
      Common().bottomError(
        context,
        e.response!.data["errors"].toString(),
      );
    }
  }

  Future signUp({
    required BuildContext context,
    required String name,
    required String gender,
    required String phoneNumberOrEmail,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      isLoading = true;
      var res = await DirtyDeedsApi.dio.post("auth/sign-up", data: {
        "name": name,
        "gender": gender,
        "phoneNumberOrEmail": phoneNumberOrEmail,
        "password": password,
        "password_confirmation": confirmPassword
      });

      String accessToken = res.data["accessToken"];

      await LocalStorage.setItem(TOKEN, accessToken);

      isLoading = false;
      notifyListeners();

      return accessToken;
    } on DioError catch (e) {
      Common().bottomError(
        context,
        e.response!.data["errors"].toString(),
      );
    }
  }

  Future getUser() async {
    try {
      String? token = LocalStorage.getItem(TOKEN);
      var res = await DirtyDeedsApi.dio.get(
        "auth/user",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      user = User.fromJson(res.data["data"]);

      notifyListeners();

      return user;
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future editProfile({
    required BuildContext context,
    required File? profilePicture,
    required String name,
  }) async {
    try {
      String? token = LocalStorage.getItem(TOKEN);

      String? fileName;
      if (profilePicture != null) {
        fileName = profilePicture.path.split('/').last;
      } else {
        fileName = null;
      }

      FormData data = FormData.fromMap({
        "profilePicture": profilePicture != null
            ? await MultipartFile.fromFile(
                profilePicture.path,
                filename: fileName,
              )
            : null,
        "name": name,
      });

      var res = await DirtyDeedsApi.dio.post(
        "edit-profile",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      user = User.fromJson(res.data);

      notifyListeners();

      return user;
    } on DioError catch (e) {
      print(e.response);
      Common().bottomError(
        context,
        e.response!.data["errors"].toString(),
      );
    }
  }

  Future logout() async {
    try {
      String? token = LocalStorage.getItem(TOKEN);

      var res = await DirtyDeedsApi.dio.get(
        "auth/logout",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      LocalStorage.clearAll();

      return res;
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
