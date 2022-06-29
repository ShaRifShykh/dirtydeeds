import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/widgets/comment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPreviewScreen extends StatelessWidget {
  const VideoPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  Path.videoImg2,
                  width: MediaQuery.of(context).size.width,
                  height: 420,
                  fit: BoxFit.cover,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: ConstantColors.blueColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Jeny Motion",
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "How to get tighter muscles",
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.thumb_up,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "100",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.thumb_down,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "10",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.remove_red_eye,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "100K",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "here I will explain how to train muscles to stay tight and supported by a diet, of course in a way that is easy for you to understand",
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 30),
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
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            hintText: "Add a comment",
                            fillColor: ConstantColors.inputColor,
                            filled: true,
                            hintStyle: GoogleFonts.roboto(
                              color: ConstantColors.mainlyTextColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Comment(
                    name: "John Doe",
                    commentAt: "3h",
                    comment:
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                    totalLikes: "150",
                    onLikePressed: () {},
                    onDisLikePressed: () {},
                  ),
                  Comment(
                    name: "John Doe",
                    commentAt: "3h",
                    comment:
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                    totalLikes: "150",
                    onLikePressed: () {},
                    onDisLikePressed: () {},
                  ),
                  Comment(
                    name: "John Doe",
                    commentAt: "3h",
                    comment:
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                    totalLikes: "150",
                    onLikePressed: () {},
                    onDisLikePressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
