// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:dirtydeeds/application/dirty_deeds_api.dart';
import 'package:flutter/material.dart';

class ConfigService extends ChangeNotifier {
  String? appName;
  String? appLogo;
  String? appEmail;
  String? appPhoneNumber;
  String? color1;
  String? color2;
  String? color3;
  String? color4;
  String? color5;
  String? color6;
  String? color7;
  String? color8;

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
      color1 = res.data["color1"];
      color2 = res.data["color2"];
      color3 = res.data["color3"];
      color4 = res.data["color4"];
      color5 = res.data["color5"];
      color6 = res.data["color6"];
      color7 = res.data["color7"];
      color8 = res.data["color8"];

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
