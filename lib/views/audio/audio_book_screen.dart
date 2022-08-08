import 'package:dirtydeeds/router/route_constant.dart';
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
    var audio = Provider.of<AudioHelper>(context, listen: false);

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
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: ConstantColors.inputColor,
              ),
            ),
            child: const Icon(
              Icons.notifications_none,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInputField(
                wantPadding: false,
                onIconPressed: () {},
                placeHolderText: "Search news, articles, etc",
                fillColor: ConstantColors.inputColor,
                searchController: searchController,
              ),
              const SizedBox(height: 25),
              audio.title(
                title: "Recently Played",
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 125,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return audio.recentlyPlayedAudio(
                      context: context,
                      onTap: () {
                        Navigator.pushNamed(context, playingAudioRoute);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              audio.title(
                title: "Popular Books",
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return audio.books(
                      onTap: () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              audio.title(
                title: "Recommended Books",
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return audio.books(
                      onTap: () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return audio.books(
                      onTap: () {},
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
