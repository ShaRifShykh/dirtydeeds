import 'package:dirtydeeds/application/services/video_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/views/video/video_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoHelper = Provider.of<VideoHelper>(context, listen: false);
    var videos = Provider.of<VideoService>(context, listen: true).videos;

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  Path.videoImg,
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 35),
                      child: Text(
                        "What hot videos interested today?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: ConstantColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return videoHelper.video(
                        context: context,
                        image: videos[index].image,
                        profilePicture: videos[index].admin!.profilePicture,
                        name:
                            "${videos[index].admin!.firstName} ${videos[index].admin!.lastName}",
                        title: videos[index].title,
                        videoLikes: videos[index].totalVideoLikes,
                        videoDisLikes: videos[index].totalVideoDislikes,
                        videoViews: videos[index].views,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            videoPreviewRoute,
                            arguments: videos[index],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
