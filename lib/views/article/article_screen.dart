import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/widgets/article_tile.dart';
import 'package:dirtydeeds/widgets/search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ConstantColors.transparent,
        title: Text(
          "Articles",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            children: [
              SearchInputField(
                wantPadding: false,
                onIconPressed: () {},
                placeHolderText: "Search news, articles, etc",
                fillColor: ConstantColors.inputColor,
                searchController: searchController,
              ),
              const SizedBox(height: 25),
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
            ],
          ),
        ),
      ),
    );
  }
}
