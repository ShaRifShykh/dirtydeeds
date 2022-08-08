import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/views/article/article_detail_screen.dart';
import 'package:dirtydeeds/views/audio/playing_audio_screen.dart';
import 'package:dirtydeeds/views/auth/login_in_screen.dart';
import 'package:dirtydeeds/views/auth/sign_up_screen.dart';
import 'package:dirtydeeds/views/blog/blog_detail_screen.dart';
import 'package:dirtydeeds/views/blog/blog_screen.dart';
import 'package:dirtydeeds/views/config/about_us_screen.dart';
import 'package:dirtydeeds/views/config/privacy_policy_screen.dart';
import 'package:dirtydeeds/views/config/terms_and_conditions_screen.dart';
import 'package:dirtydeeds/views/dashboard/dashboard_screen.dart';
import 'package:dirtydeeds/views/profile/edit_profile_screen.dart';
import 'package:dirtydeeds/views/splash/splash_screen.dart';
import 'package:dirtydeeds/views/video/video_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
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

      case articleDetailRoute:
        return PageTransition(
          child: const ArticleDetailScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case videoPreviewRoute:
        return PageTransition(
          child: const VideoPreviewScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case playingAudioRoute:
        return PageTransition(
          child: const PlayingAudioScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case blogRoute:
        return PageTransition(
          child: const BlogScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case blogDetailRoute:
        return PageTransition(
          child: const BlogDetailScreen(),
          type: PageTransitionType.rightToLeft,
        );

      case editProfileRoute:
        return PageTransition(
          child: const EditProfileScreen(),
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
