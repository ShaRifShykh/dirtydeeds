import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHelper extends ChangeNotifier {
  Widget category(
      {required String img,
      required String text,
      required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 6,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: ConstantColors.lightBlueColor,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
