import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioBookScreen extends StatelessWidget {
  const AudioBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
        title: Text(
          "Audio Book",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: ConstantColors.inputColor,
              ),
            ),
            child: Icon(
              Icons.notifications_none,
            ),
          )
        ],
      ),
    );
  }
}
