import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogHelper extends ChangeNotifier {
  Widget filterBtn({
    required String text,
    required bool isActivate,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color:
            isActivate ? ConstantColors.blueColor : ConstantColors.whiteColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color:
              isActivate ? ConstantColors.blueColor : ConstantColors.inputColor,
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: isActivate
              ? ConstantColors.whiteColor
              : ConstantColors.mainlyTextColor2,
        ),
      ),
    );
  }

  Widget blog({
    required Function onTap,
    required String image,
    required String title,
    required String writterBy,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                width: 80,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    writterBy,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: ConstantColors.mainlyTextColor2,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
