import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Common extends ChangeNotifier {
  Widget mainHeading({required String heading}) {
    return Text(
      heading,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}
