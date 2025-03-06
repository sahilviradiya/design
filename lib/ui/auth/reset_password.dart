import 'package:design/common_widgets/common_text.dart';
import 'package:design/ui/auth/successfully_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../common_widgets/common_text_field.dart';
import '../../theme/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? passwordError;
  String? confirmPasswordError;

  bool isButtonEnabled() {
    return
        newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
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
                child: SvgPicture.asset('assets/svg_image/Arrow - Left.svg',
                    width: 34, height: 34),
              ),
              Positioned(
                bottom: 80,
                left: 20,
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: "FontMain",
                  ),
                ),
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
                    controller: newPasswordController,
                    hintText: 'New Password',
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
                  SizedBox(height: 15),
                  GlobalTextFormField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm New Password',
                    isPassword: true,
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          confirmPasswordError = 'Please confirm your password';
                        } else if (value != newPasswordController.text) {
                          confirmPasswordError = 'Passwords do not match';
                        } else {
                          confirmPasswordError = null;
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
                  if (confirmPasswordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        confirmPasswordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: isButtonEnabled()
                        ? () {
                      Get.to(SuccessfullyScreen());
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: MyText(
                      text: "Reset Password",
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
