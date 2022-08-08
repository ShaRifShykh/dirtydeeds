import 'package:dirtydeeds/application/services/config_service.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  getData() {
    Provider.of<ConfigService>(context, listen: false).getTermsAndConditions();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var config = Provider.of<ConfigService>(context, listen: true);

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Terms and Conditions",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: ConstantColors.whiteColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: ConstantColors.whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: config.termsAndConditions == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Html(
                  data: config.termsAndConditions,
                  shrinkWrap: true,
                  style: {
                    // tables will have the below background color
                    "p": Style(
                      color: ConstantColors.mainlyTextColor,
                    ),
                    "li": Style(
                      color: ConstantColors.mainlyTextColor,
                    ),
                    "strong": Style(
                      color: ConstantColors.black.withOpacity(0.7),
                    ),
                  },
                ),
        ),
      ),
    );
  }
}
