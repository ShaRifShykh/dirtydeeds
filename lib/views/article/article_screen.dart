import 'package:dirtydeeds/application/services/article_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/widgets/article_tile.dart';
import 'package:dirtydeeds/widgets/search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var articles = Provider.of<ArticleService>(context, listen: true).articles;

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
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ArticleTile(
                    onTap: () {
                      Navigator.pushNamed(context, articleDetailRoute);
                    },
                    imagePath: Common.imgUrl + articles[index].image,
                    title: articles[index].title,
                    subTitle:
                        articles[index].tags.map((e) => e.tag?.name).toString(),
                    timestamp: articles[index].createdAt,
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
