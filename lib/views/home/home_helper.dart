import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHelper extends ChangeNotifier {
  Widget category(
      {required String img,
      required String text,
      required BuildContext context,
      required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
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
      ),
    );
  }

  Widget partners({required BuildContext context}) {
    return Container(
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
              Image.asset(
                Path.homeImg2,
                width: MediaQuery.of(context).size.width / 2.4,
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
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEA9459).withOpacity(0.8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: ConstantColors.whiteColor,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Mumbai city",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ConstantColors.whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Digha tour",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Complimentary Room Upgrades.",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF595959),
                  ),
                ),
                Text(
                  "23 mins ago",
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
    );
  }
}
