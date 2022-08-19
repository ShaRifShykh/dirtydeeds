import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHelper extends ChangeNotifier {
  Widget category(
      {required String img,
      required String text,
      required BuildContext context,
      required Function onTap,
      required Color color}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Image.asset(
                  img,
                  width: 20,
                  height: 23,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget partners(
      {required BuildContext context,
      required Function onTap,
      required String image,
      required String title,
      required String by,
      required String createdAt}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ConstantColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width / 2.4,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  image,
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: MediaQuery.of(context).size.width / 4,
                  fit: BoxFit.cover,
                ),
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_circle,
                      size: 50,
                      color: ConstantColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    by,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF595959),
                    ),
                  ),
                  Text(
                    createdAt,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF595959),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget journals(
      {required BuildContext context,
      required Function onTap,
      required String title,
      required String image,
      required String createdAt}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ConstantColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width / 2.4,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  image,
                  width: MediaQuery.of(context).size.width / 2.4,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 4,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    createdAt,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF595959),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
