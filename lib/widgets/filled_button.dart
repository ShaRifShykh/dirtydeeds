import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({Key? key, required this.onTap, required this.btnText})
      : super(key: key);
  final Function() onTap;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ConstantColors.blueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            btnText,
            style: GoogleFonts.roboto(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ConstantColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
