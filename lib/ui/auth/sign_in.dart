import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/png_image/image 2.png',
                    width: double.infinity, height: 250, fit: BoxFit.cover),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.35,
                  child: Image.asset('assets/png_image/gen_12.png',
                      width: 100, height: 50),
                ),
                Positioned(
                  bottom: 30,
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
                  bottom: 10,
                  left: 20,
                  child: RichText(
                    text: TextSpan(
                      text: 'New User?',
                      style: TextStyle(
                        fontFamily:
                        GoogleFonts.plusJakartaSans().fontFamily,
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
                            fontFamily:
                            GoogleFonts.plusJakartaSans().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}