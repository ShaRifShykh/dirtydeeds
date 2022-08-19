import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleHelper extends ChangeNotifier {
  Widget customAppBar({required BuildContext context}) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ConstantColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerText({
    required String category,
    required String title,
    // required String name,
  }) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ConstantColors.whiteColor.withOpacity(0.3),
                ),
                child: Text(
                  category,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: ConstantColors.whiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: ConstantColors.whiteColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget articleOwnerDetails({
    required String name,
    required String followers,
    required Function onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ConstantColors.blueColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "$followers Followers",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ConstantColors.mainlyTextColor,
                  ),
                )
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () => onTap(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: ConstantColors.mainlyTextColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "Follow",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ConstantColors.mainlyTextColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget socialIcon({required Color color, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        icon,
        color: ConstantColors.whiteColor,
      ),
    );
  }

  Widget articleHeading({required String text, required double fontSize}) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      ),
    );
  }
}
