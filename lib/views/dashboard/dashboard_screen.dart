import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/article/article_screen.dart';
import 'package:dirtydeeds/views/audio/audio_book_screen.dart';
import 'package:dirtydeeds/views/home/home_screen.dart';
import 'package:dirtydeeds/views/video/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();

  int _selectIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const VideoScreen(),
    const ArticleScreen(),
    const AudioBookScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ConstantColors.whiteColor,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _selectIndex,
        selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FontAwesomeIcons.house,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FontAwesomeIcons.video,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FontAwesomeIcons.bookOpen,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.multitrack_audio_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
