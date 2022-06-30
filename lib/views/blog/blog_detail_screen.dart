import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Health".toUpperCase(),
                style: GoogleFonts.poppins(
                  letterSpacing: 5,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: ConstantColors.darkBlueColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Strategies to avoid falls when you have osteoporsis",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 25),
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
                  const SizedBox(width: 20),
                  Text(
                    "Thilanka Soul",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.access_time,
                    color: ConstantColors.mainlyTextColor,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "1 hour ago",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ConstantColors.mainlyTextColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Text(
                "Osteoporosis is a condition in which bone density is decreased, causing the bones to become weak and much more likely to fracture. These fractures are serious and take longer to heal compared with those occurring in individuals with healthy bones. As aging occurs, the frequency of falls in the elderly tends to increase. This can",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  Path.blogImg2,
                  width: MediaQuery.of(context).size.width,
                  height: 175,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Osteoporosis is a condition in which bone density is decreased, causing the bones to become weak and much more likely to fracture. These fractures are serious and take longer to heal compared with those occurring in individuals with healthy bones. As aging occurs, the frequency of falls in the elderly tends to increase. Osteoporosis is a condition in which bone density is decreased, causing the bones to become weak and much more likely to fracture. These fractures are serious and take longer to heal compared with those occurring in individuals with healthy bones. As aging occurs, the frequency of falls in the elderly tends to increase.",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
