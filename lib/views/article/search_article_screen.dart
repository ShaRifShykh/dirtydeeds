import 'package:dirtydeeds/application/services/article_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/widgets/article_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchArticleScreen extends StatefulWidget {
  final String search;
  const SearchArticleScreen({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchArticleScreen> createState() => _SearchArticleScreenState();
}

class _SearchArticleScreenState extends State<SearchArticleScreen> {
  @override
  void initState() {
    Provider.of<ArticleService>(context, listen: false)
        .getSearchArticles(query: widget.search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var articles =
        Provider.of<ArticleService>(context, listen: true).searchArticles;

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Search Results of '${widget.search}'",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ArticleTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        articleDetailRoute,
                        arguments: articles[index],
                      );
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
