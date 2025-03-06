import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  const MyText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? null,
      // softWrap: true,
      style: TextStyle(
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: TextOverflow.visible

      ),
    );
  }
}
