import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoHelper extends ChangeNotifier {
  Widget video({required BuildContext context, required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                Path.videoImg2,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Icon(
                    Icons.play_circle,
                    size: 50,
                    color: ConstantColors.whiteColor,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEA9459).withOpacity(0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: ConstantColors.blueColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "John Doe",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: ConstantColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "IPL 2022, PBKS vs DC Highlights",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ConstantColors.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(
                            Icons.thumb_up,
                            size: 18,
                            color: ConstantColors.whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "100",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ConstantColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.thumb_down,
                            size: 18,
                            color: ConstantColors.whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "10",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ConstantColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.remove_red_eye,
                            size: 18,
                            color: ConstantColors.whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "100K",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ConstantColors.whiteColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
