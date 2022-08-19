import 'package:dirtydeeds/application/models/journal.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalDetailScreen extends StatelessWidget {
  final Journal journal;
  const JournalDetailScreen({Key? key, required this.journal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        title: const Text("Journal Detail"),
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                journal.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  // Container(
                  //   width: 40,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //     color: ConstantColors.blueColor,
                  //     borderRadius: BorderRadius.circular(50),
                  //   ),
                  // ),
                  // const SizedBox(width: 20),
                  // Text(
                  //   "Thilanka Soul",
                  //   style: GoogleFonts.poppins(
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 14,
                  //   ),
                  // ),
                  // const SizedBox(width: 20),
                  const Icon(
                    Icons.access_time,
                    color: ConstantColors.mainlyTextColor,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    journal.createdAt,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ConstantColors.mainlyTextColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  Common.imgUrl + journal.image,
                  width: MediaQuery.of(context).size.width,
                  height: 175,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Html(
                data: journal.description,
                shrinkWrap: true,
                style: {
                  "p": Style(
                    color: ConstantColors.black.withOpacity(0.6),
                    letterSpacing: 0.5,
                    fontSize: const FontSize(14),
                    fontWeight: FontWeight.w400,
                  ),
                  "strong": Style(
                    color: ConstantColors.black.withOpacity(0.7),
                    letterSpacing: 0.5,
                    fontSize: const FontSize(14),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
