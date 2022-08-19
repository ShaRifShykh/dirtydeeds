import 'package:audioplayers/audioplayers.dart';
import 'package:dirtydeeds/application/models/audio_book.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayingAudioScreen extends StatefulWidget {
  final AudioBook audioBook;
  const PlayingAudioScreen({Key? key, required this.audioBook})
      : super(key: key);

  @override
  State<PlayingAudioScreen> createState() => _PlayingAudioScreenState();
}

class _PlayingAudioScreenState extends State<PlayingAudioScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    String source = Common.imgUrl + widget.audioBook.audio;
    await audioPlayer.setSourceUrl(source);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Playing Audio",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  Common.imgUrl + widget.audioBook.image,
                  width: 240,
                  height: 240,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 240,
                child: Text(
                  widget.audioBook.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 240,
                child: Text(
                  widget.audioBook.artistName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: ConstantColors.blueColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Html(
                data: widget.audioBook.description,
                shrinkWrap: true,
                style: {
                  "p": Style(
                    color: ConstantColors.black.withOpacity(0.6),
                    // height: 2,
                    fontSize: const FontSize(14),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                  "strong": Style(
                    color: ConstantColors.black.withOpacity(0.7),
                    letterSpacing: 1.2,
                    fontSize: const FontSize(14),
                  ),
                },
              ),
              const SizedBox(height: 30),
              Slider(
                activeColor: ConstantColors.darkBlueColor,
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  await audioPlayer.resume();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position),
                    style: GoogleFonts.poppins(
                      color: ConstantColors.mainlyTextColor2,
                    ),
                  ),
                  Text(
                    formatTime(duration - position),
                    style: GoogleFonts.poppins(
                      color: ConstantColors.mainlyTextColor2,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: ConstantColors.darkBlueColor,
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: ConstantColors.whiteColor,
                  ),
                  iconSize: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
