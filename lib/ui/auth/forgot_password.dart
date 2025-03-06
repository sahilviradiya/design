import 'package:design/common_widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widgets/common_text_field.dart';
import '../../theme/colors.dart';
import 'reset_password.dart';
import 'verification_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                left: MediaQuery.of(context).size.width * 0.05,
                child: SvgPicture.asset('assets/svg_image/Arrow - Left.svg',width: 34,height: 34,
                   ),
              ),
              Positioned(
                bottom: 120,
                left: 20,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: "FontMain",
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 20,
                child:MyText(text: 'Please enter your email or phone number to \nget reset password.',color: white, maxLines: null,fontSize: 15,)
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 250),
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

                  if (passwordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        passwordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: () {
                     Get.to(VerificationScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: background, // Set your desired background color here
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      minimumSize: Size(double.infinity, 50), // Full width and height
                    ),
                    child: MyText(
                      text: "Send reset link",
                      color: Colors.white, // Text color
                      fontSize: 14, // Text size
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
