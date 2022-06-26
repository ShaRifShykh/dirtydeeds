import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/views/home/home_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var home = Provider.of<HomeHelper>(context, listen: false);
    var common = Provider.of<Common>(context, listen: false);

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      Path.homeBG,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      Path.homeBG2,
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 25,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ConstantColors.whiteColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.bars,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        hintText: "Search news, articles, etc",
                        fillColor: ConstantColors.whiteColor,
                        filled: true,
                        hintStyle: GoogleFonts.roboto(
                          color: ConstantColors.mainlyTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          Path.homeImg,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      home.category(
                        context: context,
                        img: Path.i1,
                        text: "Audiobook",
                      ),
                      home.category(
                        context: context,
                        img: Path.i2,
                        text: "Blog",
                      ),
                      home.category(
                        context: context,
                        img: Path.i3,
                        text: "Journals",
                      ),
                      home.category(
                        context: context,
                        img: Path.i4,
                        text: "Medical",
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      home.category(
                        context: context,
                        img: Path.i5,
                        text: "Education Videos",
                      ),
                      home.category(
                        context: context,
                        img: Path.i6,
                        text: "Confrences Video",
                      ),
                      home.category(
                        context: context,
                        img: Path.i7,
                        text: "Debate & Discussion",
                      ),
                      home.category(
                        context: context,
                        img: Path.i8,
                        text: "Companies Video",
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  common.mainHeading(heading: "Exclusive Partners"),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
