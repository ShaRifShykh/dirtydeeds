import 'package:dirtydeeds/application/services/article_service.dart';
import 'package:dirtydeeds/application/services/audio_book_service.dart';
import 'package:dirtydeeds/application/services/auth_service.dart';
import 'package:dirtydeeds/application/services/banner_service.dart';
import 'package:dirtydeeds/application/services/config_service.dart';
import 'package:dirtydeeds/application/services/journal_service.dart';
import 'package:dirtydeeds/application/services/video_service.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/article/article_screen.dart';
import 'package:dirtydeeds/views/audio/audio_book_screen.dart';
import 'package:dirtydeeds/views/home/home_screen.dart';
import 'package:dirtydeeds/views/profile/profile_screen.dart';
import 'package:dirtydeeds/views/video/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
    const ProfileScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  void _getData() async {
    Provider.of<AuthService>(context, listen: false).getUser();
    Provider.of<ArticleService>(context, listen: false).getArticles();
    Provider.of<AudioBookService>(context, listen: false)
        .getRecommendedAudioBooks();
    Provider.of<AudioBookService>(context, listen: false)
        .getPopularAudioBooks();
    Provider.of<JournalService>(context, listen: false).getJournals();
    Provider.of<VideoService>(context, listen: false).getVideos();
    Provider.of<BannerService>(context, listen: false).getBanners();
    Provider.of<ConfigService>(context, listen: false).getAppInfo();
  }

  @override
  void initState() {
    _getData();
    super.initState();
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
    );
  }
}
