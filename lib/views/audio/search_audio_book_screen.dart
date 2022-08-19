import 'package:dirtydeeds/application/services/audio_book_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/audio/audio_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchAudioBookScreen extends StatefulWidget {
  final String search;
  const SearchAudioBookScreen({Key? key, required this.search})
      : super(key: key);

  @override
  State<SearchAudioBookScreen> createState() => _SearchAudioBookScreenState();
}

class _SearchAudioBookScreenState extends State<SearchAudioBookScreen> {
  @override
  void initState() {
    Provider.of<AudioBookService>(context, listen: false)
        .getSearchAudioBooks(query: widget.search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var audioHelper = Provider.of<AudioHelper>(context, listen: false);
    var audioBooks =
        Provider.of<AudioBookService>(context, listen: true).searchAudioBooks;

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
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: audioBooks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return audioHelper.books(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          playingAudioRoute,
                          arguments: audioBooks[index],
                        );
                      },
                      image: Common.imgUrl + audioBooks[index].image,
                      title: audioBooks[index].title,
                      authorName: audioBooks[index].artistName,
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
