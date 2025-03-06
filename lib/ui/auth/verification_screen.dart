import 'package:design/common_widgets/common_text.dart';
import 'package:design/ui/auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../common_widgets/common_text_field.dart';
import '../../theme/colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();


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
                  'Verification Code',
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
                  child:MyText(text: 'Please enter the code you received \nthrough email.',color: white, maxLines: null,fontSize: 15,)
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Pinput(

                    length: 6, // Number of OTP digits
                    controller: _otpController,
                    focusNode: _otpFocusNode,
                    keyboardType: TextInputType.number,
                    defaultPinTheme: PinTheme(

                      width: 50,
                      height: 50,
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(color: textFieldColor,

                        borderRadius: BorderRadius.circular(8),

                      ),
                    ),
                    onCompleted: (pin) {
                      print("Entered OTP: $pin");
                      // Validate OTP here
                    },
                  ),

                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: () {
                      Get.to(ResetPassword());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: background, // Set your desired background color here
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      minimumSize: Size(double.infinity, 50), // Full width and height
                    ),
                    child: MyText(
                      text: "Continue",
                      color: Colors.white, // Text color
                      fontSize: 14, // Text size
                    ),
                  ),
                  SizedBox(height: 15,),
                  RichText(
                    text: TextSpan(
                      text: 'Didn’t get the code? ',
                      style: TextStyle(
                        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        // WidgetSpan(child: SizedBox(width: 10)),
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: background,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                          ),
                        ),
                      ],
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
