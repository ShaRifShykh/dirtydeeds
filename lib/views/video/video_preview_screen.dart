import 'package:dirtydeeds/application/models/video.dart';
import 'package:dirtydeeds/application/services/auth_service.dart';
import 'package:dirtydeeds/application/services/comment_service.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/widgets/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final Video video;
  const VideoPreviewScreen({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  TextEditingController comment = TextEditingController();
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      Common.imgUrl + widget.video.video,
    )..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthService>(context, listen: false).user;

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 420,
                    child: VideoPlayer(_controller),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: ConstantColors.whiteColor,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: const Icon(
                          //         Icons.favorite_border_rounded,
                          //         color: ConstantColors.whiteColor,
                          //       ),
                          //     ),
                          //     const SizedBox(width: 20),
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: const Icon(
                          //         Icons.share,
                          //         color: ConstantColors.whiteColor,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_circle,
                      size: 50,
                      color: ConstantColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      widget.video.admin!.profilePicture.isEmpty
                          ? Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: ConstantColors.blueColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                Common.imgUrl +
                                    widget.video.admin!.profilePicture,
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                      const SizedBox(width: 10),
                      Text(
                        "${widget.video.admin!.firstName} ${widget.video.admin!.lastName}",
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.video.title,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.thumb_up,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.video.totalVideoLikes.toString(),
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.thumb_down,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.video.totalVideoDislikes.toString(),
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.remove_red_eye,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.video.views.toString(),
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Html(
                    data: widget.video.description,
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
                  const SizedBox(height: 30),
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
                                Provider.of<CommentService>(context,
                                        listen: false)
                                    .addVideoComment(
                                  context: context,
                                  comment: comment.text,
                                  videoId: widget.video.id,
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
                    itemCount: widget.video.comments.length,
                    itemBuilder: (context, index) {
                      return Comment(
                        profilePicture:
                            widget.video.comments[index].user!.profilePicture,
                        name: widget.video.comments[index].user!.name,
                        commentAt: widget.video.comments[index].createdAt,
                        comment: widget.video.comments[index].comment,
                        totalLikes: widget
                            .video.comments[index].totalCommentLikes
                            .toString(),
                        onLikePressed: () {},
                        onDisLikePressed: () {},
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
