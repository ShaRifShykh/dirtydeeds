import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoHelper extends ChangeNotifier {
  Widget video(
      {required BuildContext context,
      required String image,
      required String profilePicture,
      required String name,
      required String title,
      required int videoLikes,
      required int videoDisLikes,
      required String videoViews,
      required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                Common.imgUrl + image,
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
                          profilePicture.isEmpty
                              ? Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: ConstantColors.blueColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    Common.imgUrl + profilePicture,
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          const SizedBox(width: 10),
                          Text(
                            name,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: ConstantColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: ConstantColors.whiteColor,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.thumb_up,
                            size: 18,
                            color: ConstantColors.whiteColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            videoLikes.toString(),
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
                            videoDisLikes.toString(),
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
                            videoViews.toString(),
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
