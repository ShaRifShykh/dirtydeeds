import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/views/article/article_helper.dart';
import 'package:dirtydeeds/widgets/comment.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var article = Provider.of<ArticleHelper>(context, listen: false);

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      Path.articleImg,
                      width: MediaQuery.of(context).size.width,
                      height: 380,
                      fit: BoxFit.cover,
                    ),
                  ),
                  article.customAppBar(context: context),
                  article.headerText(
                    category: "Health",
                    title:
                        "Jif Peanut Butter Products Recalled Over Possible Salmonella",
                    name: "By BBQ News",
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                "Buildings in the world have their own uniqueness with all kinds of types because building designers are very concerned with a man-made structure consisting of roof that is permanently erected somewhere Buildings are also commonly referred to as houses and buildings, namely facilities infrastructure or infrastructure in culture or human life in building civilization. Buildings vary in shape, size, and function and have undergone adjustments throug",
                style: GoogleFonts.poppins(
                  height: 2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ConstantColors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 25),
              article.articleOwnerDetails(
                name: "BBQ News",
                followers: "684K",
                onTap: () {},
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  article.socialIcon(
                    color: const Color(0xFF2AA4F4),
                    icon: FontAwesomeIcons.facebookF,
                  ),
                  article.socialIcon(
                    color: const Color(0xFF03A9F4),
                    icon: FontAwesomeIcons.twitter,
                  ),
                  article.socialIcon(
                    color: const Color(0xFF40C351),
                    icon: FontAwesomeIcons.whatsapp,
                  ),
                  article.socialIcon(
                    color: const Color(0xFF29B6F6),
                    icon: FontAwesomeIcons.telegram,
                  ),
                  article.socialIcon(
                    color: const Color(0xFF0288D1),
                    icon: FontAwesomeIcons.linkedinIn,
                  ),
                  article.socialIcon(
                    color: const Color(0xFFD19702),
                    icon: FontAwesomeIcons.envelope,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              article.articleHeading(
                text: "Comments",
                fontSize: 16,
              ),
              const SizedBox(height: 10),
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
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        hintText: "Add a comment",
                        fillColor: ConstantColors.inputColor,
                        filled: true,
                        hintStyle: GoogleFonts.roboto(
                          color: ConstantColors.mainlyTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Comment(
                name: "John Doe",
                commentAt: "3h",
                comment:
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                totalLikes: "150",
                onLikePressed: () {},
                onDisLikePressed: () {},
              ),
              Comment(
                name: "John Doe",
                commentAt: "3h",
                comment:
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                totalLikes: "150",
                onLikePressed: () {},
                onDisLikePressed: () {},
              ),
              Comment(
                name: "John Doe",
                commentAt: "3h",
                comment:
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                totalLikes: "150",
                onLikePressed: () {},
                onDisLikePressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
