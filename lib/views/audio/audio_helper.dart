import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioHelper extends ChangeNotifier {
  Widget title({required String title}) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget recentlyPlayedAudio({
    required BuildContext context,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width / 1.25,
        decoration: BoxDecoration(
          color: ConstantColors.greyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                Path.audioImg,
                width: 95,
                height: 95,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "An American Marriagen Oprahs Book Club",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Tayari Jones",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
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

  Widget books({required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: ConstantColors.greyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                Path.audioImg,
                width: 105,
                height: 105,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 105,
              child: Text(
                "Greek Myths Told",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Greek Myths Told",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: ConstantColors.mainlyTextColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
