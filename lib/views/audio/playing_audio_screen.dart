import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayingAudioScreen extends StatelessWidget {
  const PlayingAudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Playing Audio",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  Path.audioImg,
                  width: 240,
                  height: 240,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 240,
                child: Text(
                  "They know the explosion outside the building",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 240,
                child: Text(
                  "Tayari Jones",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: ConstantColors.blueColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  text:
                      "Dylan stay in his room while Ronny and Clara check the situation around the building. They know the explosion outside the building is happened because the cultist. ",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: 1.2,
                    color: ConstantColors.black,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "They prepare themselves with knifes they found in one of the cultist ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 1.2,
                        color: ConstantColors.black,
                      ),
                    ),
                    TextSpan(
                      text: "body who they killed before loved you by",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: 1.2,
                        color: ConstantColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
