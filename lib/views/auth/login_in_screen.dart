import 'package:dirtydeeds/application/services/auth_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/values/path.dart';
import 'package:dirtydeeds/views/auth/auth_helper.dart';
import 'package:dirtydeeds/widgets/filled_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberOrEmail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 150, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Path.pngLogo,
                width: MediaQuery.of(context).size.width - 200,
              ),
              const SizedBox(height: 60),
              TextField(
                controller: phoneNumberOrEmail,
                style: GoogleFonts.roboto(
                  color: ConstantColors.mainlyTextColor,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: Provider.of<AuthHelper>(context, listen: false)
                    .inputDecoration(
                  placeholderText: "Enter Mobile No. / Email",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: password,
                obscureText: true,
                style: GoogleFonts.roboto(
                  color: ConstantColors.mainlyTextColor,
                ),
                decoration: Provider.of<AuthHelper>(context, listen: false)
                    .inputDecoration(
                  placeholderText: "Password",
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: GoogleFonts.roboto(
                      color: ConstantColors.darkestBlueColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              FilledButton(
                onTap: () {
                  Provider.of<AuthService>(context, listen: false)
                      .signIn(
                        context: context,
                        phoneNumberOrEmail: phoneNumberOrEmail.text,
                        password: password.text,
                      )
                      .then(
                        (value) => {
                          if (value != null)
                            {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                dashboardRoute,
                                (route) => false,
                              )
                            }
                        },
                      );
                },
                btnText: "Login",
              ),
              const SizedBox(height: 35),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: ConstantColors.strokeColor,
              ),
              // const SizedBox(height: 35),
              // Text(
              //   "You can also login with",
              //   style: GoogleFonts.roboto(
              //     color: ConstantColors.mainlyTextColor,
              //   ),
              // ),
              // const SizedBox(height: 15),
              // Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // children: [
              //   Provider.of<AuthHelper>(context, listen: false).socialIcons(
              //     onTap: () {},
              //     icon: FontAwesomeIcons.facebookF,
              //   ),
              //     const SizedBox(width: 15),
              //     Provider.of<AuthHelper>(context, listen: false).socialIcons(
              //       onTap: () {},
              //       icon: FontAwesomeIcons.googlePlusG,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 90),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.roboto(
                    color: ConstantColors.mainlyTextColor,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, signUpRoute);
                        },
                      text: "Sign Up Now",
                      style: GoogleFonts.roboto(
                        color: ConstantColors.darkestBlueColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
