import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/views/blog/blog_helper.dart';
import 'package:dirtydeeds/widgets/search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var blog = Provider.of<BlogHelper>(context, listen: false);

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
        title: Text(
          "Blogs",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              SearchInputField(
                onIconPressed: () {},
                placeHolderText: "Search news, articles, etc",
                searchController: searchController,
                fillColor: ConstantColors.inputColor2,
                wantPadding: false,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  blog.filterBtn(
                    text: "All",
                    isActivate: true,
                  ),
                  blog.filterBtn(
                    text: "News",
                    isActivate: false,
                  ),
                  blog.filterBtn(
                    text: "Cricket",
                    isActivate: false,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              blog.blog(
                onTap: () {},
                image: Path.blogImg,
                title: "The style of young people in a strange world",
                writterBy: "By Robert K",
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return blog.blog(
                    onTap: () {
                      Navigator.pushNamed(context, blogDetailRoute);
                    },
                    image: Path.blogImg,
                    title: "The style of young people in a strange world",
                    writterBy: "By Robert K",
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
