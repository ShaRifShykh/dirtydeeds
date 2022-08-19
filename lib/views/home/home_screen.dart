import 'package:carousel_slider/carousel_slider.dart';
import 'package:dirtydeeds/application/services/article_service.dart';
import 'package:dirtydeeds/application/services/banner_service.dart';
import 'package:dirtydeeds/application/services/config_service.dart';
import 'package:dirtydeeds/application/services/journal_service.dart';
import 'package:dirtydeeds/application/services/video_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/views/home/home_helper.dart';
import 'package:dirtydeeds/widgets/article_tile.dart';
import 'package:dirtydeeds/widgets/search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var home = Provider.of<HomeHelper>(context, listen: false);
    var common = Provider.of<Common>(context, listen: false);
    var articles = Provider.of<ArticleService>(context, listen: true).articles;
    var videos = Provider.of<VideoService>(context, listen: false).videos;
    var journals = Provider.of<JournalService>(context, listen: false).journals;
    var banners = Provider.of<BannerService>(context, listen: true).banners;
    var appInfos = Provider.of<ConfigService>(context, listen: true);

    return Scaffold(
      key: _drawerKey,
      drawer: Provider.of<Common>(context, listen: false).drawer(context),
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      Path.homeBG,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      Path.homeBG2,
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 25,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ConstantColors.whiteColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _drawerKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.bars,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  child: SearchInputField(
                    onIconPressed: () {},
                    wantPadding: true,
                    placeHolderText: "Search news, articles, etc",
                    fillColor: ConstantColors.whiteColor,
                    searchController: searchController,
                  ),
                ),
                Positioned(
                  top: 180,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                      ),
                      items: banners.map((banner) {
                        return Builder(builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    width: MediaQuery.of(context).size.width,
                                    height: 160,
                                    Common.imgUrl + banner.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      home.category(
                        onTap: () {
                          Navigator.pushNamed(context, audioBookRoute);
                        },
                        context: context,
                        img: Path.i1,
                        text: "Audiobook",
                        color: Common().colorFromHex(
                          appInfos.color1 ?? "#A9DAFF",
                        ),
                      ),
                      home.category(
                        onTap: () {
                          Navigator.pushNamed(context, blogRoute);
                        },
                        context: context,
                        img: Path.i2,
                        text: "Blog",
                        color: Common().colorFromHex(
                          appInfos.color2 ?? "#A9DAFF",
                        ),
                      ),
                      home.category(
                        onTap: () {
                          Navigator.pushNamed(context, journalRoute);
                        },
                        context: context,
                        img: Path.i3,
                        text: "Journals",
                        color: Common().colorFromHex(
                          appInfos.color3 ?? "#A9DAFF",
                        ),
                      ),
                      home.category(
                        onTap: () {
                          Navigator.pushNamed(context, articleRoute);
                        },
                        context: context,
                        img: Path.i4,
                        text: "Medical",
                        color: Common().colorFromHex(
                          appInfos.color4 ?? "#A9DAFF",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      home.category(
                        onTap: () {
                          Navigator.pushNamed(context, videoRoute);
                        },
                        context: context,
                        img: Path.i5,
                        text: "Education Videos",
                        color: Common().colorFromHex(
                          appInfos.color5 ?? "#A9DAFF",
                        ),
                      ),
                      home.category(
                        onTap: () {
                          Navigator.pushNamed(context, videoRoute);
                        },
                        context: context,
                        img: Path.i6,
                        text: "Confrences Video",
                        color: Common().colorFromHex(
                          appInfos.color6 ?? "#A9DAFF",
                        ),
                      ),
                      home.category(
                        onTap: () {
                          Navigator.pushNamed(context, videoRoute);
                        },
                        context: context,
                        img: Path.i7,
                        text: "Debate & Discussion",
                        color: Common().colorFromHex(
                          appInfos.color7 ?? "#A9DAFF",
                        ),
                      ),
                      home.category(
                        onTap: () {
                          Navigator.pushNamed(context, videoRoute);
                        },
                        context: context,
                        img: Path.i8,
                        text: "Companies Video",
                        color: Common().colorFromHex(
                          appInfos.color8 ?? "#A9DAFF",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  common.mainHeading(heading: "Exclusive Partners"),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5),
                    ),
                    itemCount: videos.length < 2 ? videos.length : 2,
                    itemBuilder: (context, index) {
                      return home.partners(
                        context: context,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            videoPreviewRoute,
                            arguments: videos[index],
                          );
                        },
                        image: Common.imgUrl + videos[index].image,
                        title: videos[index].title,
                        by: videos[index].admin!.firstName,
                        createdAt: videos[index].createdAt,
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  common.mainHeading(heading: "Journals"),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5),
                    ),
                    itemCount: journals.length < 2 ? journals.length : 2,
                    itemBuilder: (context, index) {
                      return home.journals(
                        context: context,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            journalDetailRoute,
                            arguments: journals[index],
                          );
                        },
                        image: Common.imgUrl + journals[index].image,
                        title: journals[index].title,
                        createdAt: journals[index].createdAt,
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  common.mainHeading(heading: "Latest Health News"),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: articles.length < 2 ? articles.length : 2,
                    itemBuilder: (context, index) {
                      return ArticleTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            articleDetailRoute,
                            arguments: articles[index],
                          );
                        },
                        imagePath: Common.imgUrl + articles[index].image,
                        title: articles[index].title,
                        subTitle: articles[index]
                            .tags
                            .map((e) => e.tag?.name)
                            .toString(),
                        timestamp: articles[index].createdAt,
                      );
                    },
                  ),

                  // End Spacing
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
