import 'package:design/common_widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../common_widgets/common_text_field.dart';
import '../../theme/colors.dart';
import 'verification_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  String? emailError;

  bool isButtonEnabled() {
    return emailError == null && emailController.text.isNotEmpty;
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
                child: SvgPicture.asset(
                  'assets/svg_image/Arrow - Left.svg',
                  width: 34,
                  height: 34,
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
                  child: MyText(
                    text:
                    'Please enter your email or phone number to \nget reset password.',
                    color: white,
                    maxLines: null,
                    fontSize: 15,
                  )),
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
                        emailError = (value.isEmpty)
                            ? 'Please enter your email'
                            : (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value))
                            ? 'Enter a valid email'
                            : null;
                      });
                    },
                  ),
                  if (emailError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        emailError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: isButtonEnabled()
                        ? () {
                      Get.to(VerificationScreen());
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: background, // Enabled color
                      disabledBackgroundColor: background, // Keeps the same color when disabled
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const MyText(
                      text: "Send reset link",
                      color: Colors.white,
                      fontSize: 14,
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
