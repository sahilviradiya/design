import 'package:design/common_widgets/common_text.dart';
import 'package:design/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessfullyScreen extends StatefulWidget {
  const SuccessfullyScreen({super.key});

  @override
  State<SuccessfullyScreen> createState() => _SuccessfullyScreenState();
}

class _SuccessfullyScreenState extends State<SuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset('assets/svg_image/Vector_green.svg',height: 66,width: 66,
              ),

            ),
            SizedBox(height: 25,),

            MyText(text: 'Password has been set successfully',fontWeight: FontWeight.w600,fontSize: 24,textAlign: TextAlign.center,),
            SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                // Get.to(SuccessfullyScreen());
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

          ],
        ),
      ),
    );
  }
}
