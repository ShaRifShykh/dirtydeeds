import 'dart:io';
import 'package:dirtydeeds/application/services/auth_service.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/auth/auth_helper.dart';
import 'package:dirtydeeds/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumberOrEmail = TextEditingController();

  updateProfile({
    required BuildContext context,
    required File? profilePicture,
  }) {
    Provider.of<AuthService>(context, listen: false)
        .editProfile(
      context: context,
      profilePicture: profilePicture,
      name: name.text,
    )
        .then((value) {
      if (value != null) {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: "Profile Updated!",
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var common = Provider.of<Common>(context, listen: true);
    var user = Provider.of<AuthService>(context, listen: true).user;
    name.text = user!.name;
    phoneNumberOrEmail.text = user.phoneNumberOrEmail;

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            color: ConstantColors.whiteColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: ConstantColors.whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  user.profilePicture.isEmpty
                      ? Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: ConstantColors.blueColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            Common.imgUrl + user.profilePicture,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                  Positioned(
                    top: 90,
                    left: 100,
                    child: GestureDetector(
                        onTap: () {
                          common.pickImage().then((value) {
                            if (value != null) {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.success(
                                  message: "Profile Image Selected!",
                                  textStyle: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: ConstantColors.whiteColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: ConstantColors.blueColor,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              TextField(
                controller: name,
                style: GoogleFonts.roboto(
                  color: ConstantColors.mainlyTextColor,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: Provider.of<AuthHelper>(context, listen: false)
                    .inputDecoration(
                  placeholderText: "Enter your name",
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: phoneNumberOrEmail,
                enabled: false,
                style: GoogleFonts.roboto(
                  color: ConstantColors.mainlyTextColor,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: Provider.of<AuthHelper>(context, listen: false)
                    .inputDecoration(
                  placeholderText: "Enter Mobile No. / Email",
                ),
              ),
              const SizedBox(height: 50),
              FilledButton(
                onTap: () => updateProfile(
                  context: context,
                  profilePicture: common.getimg,
                ),
                btnText: "Update Profile",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
