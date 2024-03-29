import 'package:dirtydeeds/application/services/auth_service.dart';
import 'package:dirtydeeds/router/route_constant.dart';
import 'package:dirtydeeds/values/constant_colors.dart';
import 'package:dirtydeeds/views/auth/auth_helper.dart';
import 'package:dirtydeeds/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumberOrEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final List<String> _genders = [
    'Male',
    'Female',
  ];

  String _genderValue = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _genderValue = _genders[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    var _authService = Provider.of<AuthService>(context, listen: true);

    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Register",
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create a new Account",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ConstantColors.darkestBlueColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Create an account so you can manage your personal finances",
                style: GoogleFonts.roboto(
                  color: ConstantColors.mainlyTextColor,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: name,
                style: GoogleFonts.roboto(
                  color: ConstantColors.mainlyTextColor,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: Provider.of<AuthHelper>(context, listen: false)
                    .inputDecoration(
                  placeholderText: "Enter your name",
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      decoration: BoxDecoration(
                        color: ConstantColors.inputColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "You are",
                        style: GoogleFonts.roboto(
                          color: ConstantColors.mainlyTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 3,
                    child: DropdownButton<String>(
                      underline: Container(),
                      style: GoogleFonts.roboto(
                        color: ConstantColors.mainlyTextColor,
                        fontSize: 14,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: ConstantColors.inputColor,
                      isExpanded: true,
                      value: _genderValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _genderValue = newValue!;
                        });
                      },
                      items: _genders
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                controller: phoneNumberOrEmail,
                style: GoogleFonts.roboto(
                  color: ConstantColors.mainlyTextColor,
                ),
                decoration: Provider.of<AuthHelper>(context, listen: false)
                    .inputDecoration(
                  placeholderText: "Enter phone number",
                ),
              ),
              const SizedBox(height: 15),
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
              TextField(
                controller: confirmPassword,
                obscureText: true,
                style: GoogleFonts.roboto(
                  color: ConstantColors.mainlyTextColor,
                ),
                decoration: Provider.of<AuthHelper>(context, listen: false)
                    .inputDecoration(
                  placeholderText: "Confirm Password",
                ),
              ),
              const SizedBox(height: 15),
              _authService.isLoading
                  ? const CircularProgressIndicator()
                  : FilledButton(
                      onTap: () async {
                        Provider.of<AuthService>(context, listen: false)
                            .signUp(
                              context: context,
                              name: name.text,
                              gender: _genderValue,
                              phoneNumberOrEmail: phoneNumberOrEmail.text,
                              password: password.text,
                              confirmPassword: confirmPassword.text,
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
                      btnText: "Next",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
