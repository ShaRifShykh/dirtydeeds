// ignore_for_file: avoid_print

import 'dart:io';
import 'package:dirtydeeds/application/services/auth_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Common extends ChangeNotifier {
  // static const String baseUrl = "http://themediplanet.co/api/";
  // static const String imgUrl = "http://themediplanet.co/storage/";

  static const String baseUrl = "http://10.0.2.2:8000/api/";
  static const String imgUrl = "http://10.0.2.2:8000/storage/";

  File? _img;
  File? get getimg => _img;

  Widget mainHeading({required String heading}) {
    return Text(
      heading,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }

  Widget tile({required Function onPressed, required String title}) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () => onPressed(),
    );
  }

  Widget drawer(BuildContext context) {
    return Drawer(
      backgroundColor: ConstantColors.blueColor,
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: ConstantColors.whiteColor,
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hey There !",
                        style: GoogleFonts.poppins(
                          color: ConstantColors.whiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            height: MediaQuery.of(context).size.height / 1.4,
            decoration: const BoxDecoration(
              color: ConstantColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                tile(
                  onPressed: () {
                    Navigator.pushNamed(context, editProfileRoute);
                  },
                  title: "Edit Profile",
                ),
                tile(
                  onPressed: () {
                    Navigator.pushNamed(context, aboutUsRoute);
                  },
                  title: "About Us",
                ),
                tile(
                  onPressed: () {
                    Navigator.pushNamed(context, ppRoute);
                  },
                  title: "Privacy Policy",
                ),
                tile(
                  onPressed: () {
                    Navigator.pushNamed(context, tacRoute);
                  },
                  title: "Terms and Conditions",
                ),
                tile(
                  onPressed: () {
                    Provider.of<AuthService>(context, listen: false)
                        .logout()
                        .then((value) {
                      if (value != null) {
                        success(context, "Successfully Logout!");
                        Navigator.pushNamedAndRemoveUntil(
                            context, loginRoute, (route) => false);
                      }
                    });
                  },
                  title: "Logout",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bottomSuccess(BuildContext context, String success) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          success,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  success(BuildContext context, String message) {
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: message,
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }

  bottomError(BuildContext context, String error) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          error,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);

      _img = imageTemp;
      notifyListeners();

      return _img;
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
