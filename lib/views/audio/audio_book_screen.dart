import 'package:dirtydeeds/application/services/audio_book_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/audio/audio_helper.dart';
import 'package:dirtydeeds/widgets/search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AudioBookScreen extends StatefulWidget {
  const AudioBookScreen({Key? key}) : super(key: key);

  @override
  State<AudioBookScreen> createState() => _AudioBookScreenState();
}

class _AudioBookScreenState extends State<AudioBookScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var audioHelper = Provider.of<AudioHelper>(context, listen: false);
    var popularAudioBooks =
        Provider.of<AudioBookService>(context, listen: true).popularAudioBooks;
    var recommendedAudioBooks =
        Provider.of<AudioBookService>(context, listen: true)
            .recommendedAudioBooks;

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
        title: Text(
          "Audio Book",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   Container(
        //     padding: const EdgeInsets.all(10),
        //     margin: const EdgeInsets.all(5),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(50),
        //       border: Border.all(
        //         color: ConstantColors.inputColor,
        //       ),
        //     ),
        //     child: const Icon(
        //       Icons.notifications_none,
        //     ),
        //   ),
        //   const SizedBox(width: 10),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInputField(
                wantPadding: false,
                onIconPressed: () {
                  if (searchController.text.isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      searchAudiBookRoute,
                      arguments: searchController.text,
                    );
                  } else {
                    Common()
                        .bottomError(context, "Search field can't be empty!");
                  }
                },
                placeHolderText: "Search news, articles, etc",
                fillColor: ConstantColors.inputColor,
                searchController: searchController,
              ),
              const SizedBox(height: 25),
              audioHelper.title(
                title: "Popular Books",
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: popularAudioBooks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return audioHelper.books(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          playingAudioRoute,
                          arguments: popularAudioBooks[index],
                        );
                      },
                      image: Common.imgUrl + popularAudioBooks[index].image,
                      title: popularAudioBooks[index].title,
                      authorName: popularAudioBooks[index].artistName,
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              audioHelper.title(
                title: "Recommended Books",
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: recommendedAudioBooks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return audioHelper.books(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          playingAudioRoute,
                          arguments: recommendedAudioBooks[index],
                        );
                      },
                      image: Common.imgUrl + recommendedAudioBooks[index].image,
                      title: recommendedAudioBooks[index].title,
                      authorName: recommendedAudioBooks[index].artistName,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
