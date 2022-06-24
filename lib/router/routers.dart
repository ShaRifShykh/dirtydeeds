import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/views/auth/login_in_screen.dart';
import 'package:dirtydeeds/views/auth/sign_up_screen.dart';
import 'package:dirtydeeds/views/dashboard/dashboard_screen.dart';
import 'package:dirtydeeds/views/splash/splash_screen.dart';
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

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
