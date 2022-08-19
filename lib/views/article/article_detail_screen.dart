import 'package:dirtydeeds/application/models/article.dart';
import 'package:dirtydeeds/application/services/auth_service.dart';
import 'package:dirtydeeds/application/services/comment_service.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/article/article_helper.dart';
import 'package:dirtydeeds/widgets/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArticleDetailScreen extends StatefulWidget {
  final Article article;
  const ArticleDetailScreen({Key? key, required this.article})
      : super(key: key);

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var articleHelper = Provider.of<ArticleHelper>(context, listen: false);
    var user = Provider.of<AuthService>(context, listen: true).user;

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
                    child: Image.network(
                      Common.imgUrl + widget.article.image,
                      width: MediaQuery.of(context).size.width,
                      height: 380,
                      fit: BoxFit.cover,
                    ),
                  ),
                  articleHelper.customAppBar(context: context),
                  articleHelper.headerText(
                    category: widget.article.category!.name,
                    title: widget.article.title,
                    // name: "By BBQ News ${article.}",
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Html(
                data: widget.article.description,
                shrinkWrap: true,
                style: {
                  "p": Style(
                    color: ConstantColors.black.withOpacity(0.6),
                    // height: 2,
                    fontSize: const FontSize(14),
                    fontWeight: FontWeight.w400,
                  ),
                  "strong": Style(
                    color: ConstantColors.black.withOpacity(0.7),
                  ),
                },
              ),
              // const SizedBox(height: 25),
              // articleHelper.articleOwnerDetails(
              //   name: "BBQ News",
              //   followers: "684K",
              //   onTap: () {},
              // ),
              // const SizedBox(height: 40),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     articleHelper.socialIcon(
              //       color: const Color(0xFF2AA4F4),
              //       icon: FontAwesomeIcons.facebookF,
              //     ),
              //     articleHelper.socialIcon(
              //       color: const Color(0xFF03A9F4),
              //       icon: FontAwesomeIcons.twitter,
              //     ),
              //     articleHelper.socialIcon(
              //       color: const Color(0xFF40C351),
              //       icon: FontAwesomeIcons.whatsapp,
              //     ),
              //     articleHelper.socialIcon(
              //       color: const Color(0xFF29B6F6),
              //       icon: FontAwesomeIcons.telegram,
              //     ),
              //     articleHelper.socialIcon(
              //       color: const Color(0xFF0288D1),
              //       icon: FontAwesomeIcons.linkedinIn,
              //     ),
              //     articleHelper.socialIcon(
              //       color: const Color(0xFFD19702),
              //       icon: FontAwesomeIcons.envelope,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 40),
              articleHelper.articleHeading(
                text: "Comments",
                fontSize: 16,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  user!.profilePicture.isEmpty
                      ? Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: ConstantColors.blueColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            Common.imgUrl + user.profilePicture,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: comment,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            Provider.of<CommentService>(context, listen: false)
                                .addArticleComment(
                              context: context,
                              comment: comment.text,
                              articleId: widget.article.id,
                            )
                                .then((value) {
                              if (value != null) {
                                Common().success(
                                  context,
                                  "Comment added successfully!",
                                );
                                comment.text = "";
                              }
                            });
                          },
                          child: const Icon(
                            Icons.send,
                            color: ConstantColors.black,
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.article.comments.length,
                itemBuilder: (context, index) {
                  return Comment(
                    profilePicture:
                        widget.article.comments[index].user!.profilePicture,
                    name: widget.article.comments[index].user!.name,
                    commentAt: widget.article.comments[index].createdAt,
                    comment: widget.article.comments[index].comment,
                    totalLikes: widget.article.comments[index].totalCommentLikes
                        .toString(),
                    onLikePressed: () {},
                    onDisLikePressed: () {},
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
