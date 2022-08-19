import 'package:dirtydeeds/application/models/article.dart';
import 'package:dirtydeeds/application/models/audio_book.dart';
import 'package:dirtydeeds/application/models/journal.dart';
import 'package:dirtydeeds/application/models/video.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/views/article/article_detail_screen.dart';
import 'package:dirtydeeds/views/article/article_screen.dart';
import 'package:dirtydeeds/views/article/search_article_screen.dart';
import 'package:dirtydeeds/views/audio/audio_book_screen.dart';
import 'package:dirtydeeds/views/audio/playing_audio_screen.dart';
import 'package:dirtydeeds/views/audio/search_audio_book_screen.dart';
import 'package:dirtydeeds/views/auth/login_in_screen.dart';
import 'package:dirtydeeds/views/auth/sign_up_screen.dart';
import 'package:dirtydeeds/views/blog/blog_detail_screen.dart';
import 'package:dirtydeeds/views/blog/blog_screen.dart';
import 'package:dirtydeeds/views/config/about_us_screen.dart';
import 'package:dirtydeeds/views/config/privacy_policy_screen.dart';
import 'package:dirtydeeds/views/config/terms_and_conditions_screen.dart';
import 'package:dirtydeeds/views/dashboard/dashboard_screen.dart';
import 'package:dirtydeeds/views/journal/journal_detail_screen.dart';
import 'package:dirtydeeds/views/journal/journal_screen.dart';
import 'package:dirtydeeds/views/profile/edit_profile_screen.dart';
import 'package:dirtydeeds/views/search/search_screen.dart';
import 'package:dirtydeeds/views/splash/splash_screen.dart';
import 'package:dirtydeeds/views/video/video_preview_screen.dart';
import 'package:dirtydeeds/views/video/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      // Auth Routes
      case loginRoute:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case signUpRoute:
        return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.rightToLeft,
        );

      // Main Routes
      case dashboardRoute:
        return PageTransition(
          child: const DashboardScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case audioBookRoute:
        return PageTransition(
          child: const AudioBookScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case articleRoute:
        return PageTransition(
          child: const ArticleScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case videoRoute:
        return PageTransition(
          child: const VideoScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case articleDetailRoute:
        return PageTransition(
          child: ArticleDetailScreen(
            article: args as Article,
          ),
          type: PageTransitionType.rightToLeft,
        );

      case videoPreviewRoute:
        return PageTransition(
          child: VideoPreviewScreen(
            video: args as Video,
          ),
          type: PageTransitionType.rightToLeft,
        );

      case playingAudioRoute:
        return PageTransition(
          child: PlayingAudioScreen(
            audioBook: args as AudioBook,
          ),
          type: PageTransitionType.rightToLeft,
        );

      case blogRoute:
        return PageTransition(
          child: const BlogScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case blogDetailRoute:
        return PageTransition(
          child: BlogDetailScreen(
            article: args as Article,
          ),
          type: PageTransitionType.rightToLeft,
        );

      case journalRoute:
        return PageTransition(
          child: const JournalScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case journalDetailRoute:
        return PageTransition(
          child: JournalDetailScreen(
            journal: args as Journal,
          ),
          type: PageTransitionType.rightToLeft,
        );

      case editProfileRoute:
        return PageTransition(
          child: const EditProfileScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case searchRoute:
        return PageTransition(
          child: SearchScreen(
            search: args as String,
          ),
          type: PageTransitionType.rightToLeft,
        );

      case searchArticleRoute:
        return PageTransition(
          child: SearchArticleScreen(
            search: args as String,
          ),
          type: PageTransitionType.rightToLeft,
        );

      case searchAudiBookRoute:
        return PageTransition(
          child: SearchAudioBookScreen(
            search: args as String,
          ),
          type: PageTransitionType.rightToLeft,
        );

      // Config Routes
      case aboutUsRoute:
        return PageTransition(
          child: const AboutUsScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case ppRoute:
        return PageTransition(
          child: const PrivacyPolicyScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case tacRoute:
        return PageTransition(
          child: const TermsAndConditionsScreen(),
          type: PageTransitionType.rightToLeft,
        );

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
