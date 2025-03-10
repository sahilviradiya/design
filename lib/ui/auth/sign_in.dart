import 'package:design/common_widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widgets/common_text_field.dart';
import '../../theme/colors.dart';
import 'forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  bool  isButtonEnabled() {
    return emailError == null &&
        passwordError == null &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
          Stack(
            children: [
              Image.asset('assets/png_image/image 2.png',
                  width: double.infinity, height: 300, fit: BoxFit.cover),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Image.asset('assets/png_image/gen_12.png',
                    width: 100, height: 50),
              ),
              Positioned(
                bottom: 115,
                left: 20,
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: "FontMain",
                  ),
                ),
              ),
              Positioned(
                bottom: 90,
                left: 20,
                child: RichText(
                  text: TextSpan(
                    text: 'New User?',
                    style: TextStyle(
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    children: [
                      WidgetSpan(child: SizedBox(width: 10)),
                      TextSpan(
                        text: 'Create an account',
                        style: TextStyle(
                          color: background,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 220),
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GlobalTextFormField(
                    controller: emailController,
                    hintText: 'tabish@m2m.com',
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          emailError = 'Please enter your email';
                        } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          emailError = 'Enter a valid email';
                        } else {
                          emailError = null;
                        }
                      });
                    },
                  ),
                  if (emailError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        emailError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 12),
                  GlobalTextFormField(
                    controller: passwordController,
                    hintText: '*********',
                    isPassword: true,
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          passwordError = 'Please enter your password';
                        } else if (value.length < 6) {
                          passwordError = 'Password must be at least 6 characters';
                        } else {
                          passwordError = null;
                        }
                      });
                    },
                  ),
                  if (passwordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        passwordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Get.to(ForgotPassword());
                    },
                    child: MyText(
                      text: 'Forgot Password?',
                      color: background,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Add your action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: background, // Set your desired background color here
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      minimumSize: Size(double.infinity, 50), // Full width and height
                    ),
                    child: MyText(
                      text: "Sign in",
                      color: Colors.white, // Text color
                      fontSize: 14, // Text size
                    ),
                  ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.7,),
              Center(child: MyText(text: 'Pricing  -  Blog  -  About'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
