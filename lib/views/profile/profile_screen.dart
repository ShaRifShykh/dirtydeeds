import 'package:dirtydeeds/application/services/auth_service.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/profile/profile_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthService>(context, listen: false).user;

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Provider.of<ProfileHelper>(context, listen: false).header(
              Provider.of<AuthService>(context, listen: false)
                  .user!
                  .profilePicture,
              Provider.of<AuthService>(context, listen: false)
                  .user!
                  .phoneNumberOrEmail,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 18,
              color: const Color(0xFFF2F2F2),
            ),
            Provider.of<ProfileHelper>(context, listen: false).section(
              "Name",
              Provider.of<AuthService>(context, listen: false).user!.name,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: const Color(0xFFF2F2F2),
            ),
            Provider.of<ProfileHelper>(context, listen: false).section(
              "Phone Number or Email",
              Provider.of<AuthService>(context, listen: false)
                  .user!
                  .phoneNumberOrEmail,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: const Color(0xFFF2F2F2),
            ),
            Provider.of<ProfileHelper>(context, listen: false).section(
              "Gender",
              Provider.of<AuthService>(context, listen: false).user!.gender,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: const Color(0xFFF2F2F2),
            ),
            Provider.of<ProfileHelper>(context, listen: false).section(
              "Joined On",
              Provider.of<AuthService>(context, listen: false).user!.createdAt,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: const Color(0xFFF2F2F2),
            ),
          ],
        ),
      ),
    );
  }
}
