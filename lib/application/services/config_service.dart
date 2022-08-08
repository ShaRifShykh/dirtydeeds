// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:flutter/material.dart';

class ConfigService extends ChangeNotifier {
  String? appName;
  String? appLogo;
  String? appEmail;
  String? appPhoneNumber;

  String? aboutUs;
  String? privacyPolicy;
  String? termsAndConditions;

  Future getAppInfo() async {
    try {
      var res = await DirtyDeedsApi.dio.get(
        "config/app-info",
      );

      appName = res.data["appName"];
      appLogo = res.data["appLogo"];
      appEmail = res.data["appEmail"];
      appPhoneNumber = res.data["appPhoneNumber"];

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future getAboutUs() async {
    try {
      var res = await DirtyDeedsApi.dio.get(
        "config/about-us",
      );

      aboutUs = res.data["aboutUs"];

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future getPrivacyPolicy() async {
    try {
      var res = await DirtyDeedsApi.dio.get(
        "config/privacy-policy",
      );

      privacyPolicy = res.data["privacyPolicy"];

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }

  Future getTermsAndConditions() async {
    try {
      var res = await DirtyDeedsApi.dio.get(
        "config/terms-and-conditions",
      );

      termsAndConditions = res.data["termsAndConditions"];

      notifyListeners();
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
