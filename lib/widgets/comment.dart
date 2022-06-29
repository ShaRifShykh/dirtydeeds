import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Comment extends StatelessWidget {
  const Comment(
      {Key? key,
      required this.name,
      required this.commentAt,
      required this.comment,
      required this.totalLikes,
      required this.onLikePressed,
      required this.onDisLikePressed})
      : super(key: key);

  final String name;
  final String commentAt;
  final String comment;
  final String totalLikes;
  final void Function() onLikePressed;
  final void Function() onDisLikePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text(
              name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              commentAt,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Text(
          comment,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onLikePressed,
              icon: const Icon(
                FontAwesomeIcons.thumbsUp,
              ),
            ),
            // const SizedBox(width: 10),
            Text(
              totalLikes,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 40),
            IconButton(
              onPressed: onDisLikePressed,
              icon: const Icon(
                FontAwesomeIcons.thumbsDown,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
