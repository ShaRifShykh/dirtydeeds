import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/views/home/home_helper.dart';
import 'package:dirtydeeds/widgets/article_tile.dart';
import 'package:dirtydeeds/widgets/search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

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
              alignment: Alignment.center,
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
                  child: SearchInputField(
                    onIconPressed: () {},
                    wantPadding: true,
                    placeHolderText: "Search news, articles, etc",
                    fillColor: ConstantColors.whiteColor,
                    searchController: searchController,
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
                  repeater(context, home),
                  const SizedBox(height: 40),
                  common.mainHeading(heading: "Journals"),
                  const SizedBox(height: 25),
                  repeater(context, home),
                  const SizedBox(height: 40),
                  common.mainHeading(heading: "Latest Health News"),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return const ArticleTile(
                        imagePath: Path.homeImg3,
                        title: "What To Eat During Pregnancy?",
                        subTitle: "Complimentary Room Upgrades,",
                        timestamp: "2 DAYS AGO",
                      );
                    },
                  ),

                  // End Spacing
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget repeater(BuildContext context, home) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          home.partners(context: context),
          home.partners(context: context),
        ],
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          home.partners(context: context),
          home.partners(context: context),
        ],
      ),
    ],
  );
}
