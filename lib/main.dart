import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/router/routers.dart';
import 'package:dirtydeeds/values/branding_color.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/views/article/article_helper.dart';
import 'package:dirtydeeds/views/audio/audio_helper.dart';
import 'package:dirtydeeds/views/auth/auth_helper.dart';
import 'package:dirtydeeds/views/blog/blog_helper.dart';
import 'package:dirtydeeds/views/home/home_helper.dart';
import 'package:dirtydeeds/views/video/video_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DirtyDeeds());
}

class DirtyDeeds extends StatelessWidget {
  const DirtyDeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Common()),
        ChangeNotifierProvider(create: (_) => AuthHelper()),
        ChangeNotifierProvider(create: (_) => HomeHelper()),
        ChangeNotifierProvider(create: (_) => VideoHelper()),
        ChangeNotifierProvider(create: (_) => ArticleHelper()),
        ChangeNotifierProvider(create: (_) => AudioHelper()),
        ChangeNotifierProvider(create: (_) => BlogHelper()),
      ],
      child: MaterialApp(
        title: 'Dirty Deeds',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
          ).fontFamily,
          primarySwatch: brandingColor,
        ),
        onGenerateRoute: Routers.onGenerateRoute,
        initialRoute: splashRoute,
      ),
    );
  }
}
