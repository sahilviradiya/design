import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isPassword;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged; // Optional onChanged callback

  const GlobalTextFormField({
    Key? key,
    this.controller,
    required this.hintText,
    this.isPassword = false,
    this.prefixIcon,
    this.onChanged, // Accept onChanged as a parameter
  }) : super(key: key);

  @override
  _GlobalTextFormFieldState createState() => _GlobalTextFormFieldState();
}

class _GlobalTextFormFieldState extends State<GlobalTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: const Color(0xFFF6F6F7), // Default cursor color
      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged, // Pass input changes to the callback
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey, // Default hint text color
          fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          fontSize: 15,
        ),
        fillColor: const Color(0xFFF6F6F7), // Default background color
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide.none,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
    );
  }
}
