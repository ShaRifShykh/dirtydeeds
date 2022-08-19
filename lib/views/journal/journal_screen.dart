import 'package:dirtydeeds/application/services/journal_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/common.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/blog/blog_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blog = Provider.of<BlogHelper>(context, listen: false);
    var journals = Provider.of<JournalService>(context, listen: true).journals;

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
        title: Text(
          "Journals",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: journals.length,
                itemBuilder: (context, index) {
                  return blog.blog(
                    onTap: () {
                      Navigator.pushNamed(context, journalDetailRoute,
                          arguments: journals[index]);
                    },
                    image: Common.imgUrl + journals[index].image,
                    title: journals[index].title,
                    writterBy: journals[index].createdAt,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
