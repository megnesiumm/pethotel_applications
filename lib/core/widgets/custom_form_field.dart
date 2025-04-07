import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconPressed;
  final List<TextInputFormatter>? inputFormatters;

  const CustomFormField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.onSuffixIconPressed,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 14, top: 8, bottom: 8),

          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFFF989898), fontSize: 14),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(0xFFFFA1A1A1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(0xFF7B61FF)),
          ),
          suffixIcon:
              suffixIcon != null
                  ? IconButton(
                    icon: Icon(suffixIcon, color: Color(0xFFFF989898)),
                    onPressed: onSuffixIconPressed,
                  )
                  : null,
        ),
        validator: validator,
      ),
    );
  }
}
