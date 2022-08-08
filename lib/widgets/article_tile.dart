import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.timestamp,
    required this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  final String imagePath;
  final String title;
  final String subTitle;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: ConstantColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                width: 100,
                height: 60,
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: ConstantColors.mainlyTextColor,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: ConstantColors.mainlyTextColor,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        timestamp.toUpperCase(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: ConstantColors.mainlyTextColor,
                          fontSize: 11,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
