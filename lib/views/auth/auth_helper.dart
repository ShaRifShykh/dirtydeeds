import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHelper extends ChangeNotifier {
  InputDecoration inputDecoration({required String placeholderText}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      hintText: placeholderText,
      fillColor: ConstantColors.inputColor,
      filled: true,
      helperStyle: GoogleFonts.roboto(
        color: ConstantColors.mainlyTextColor,
        fontSize: 14,
      ),
    );
  }

  Widget socialIcons({required Function onTap, required IconData icon}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: ConstantColors.blueColor,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Icon(
            icon,
            color: ConstantColors.blueColor,
          ),
        ),
      ),
    );
  }
}
