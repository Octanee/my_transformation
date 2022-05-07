import 'package:flutter/material.dart';
import 'package:my_transformation/src/widget/widget.dart';

class CustomFormInput extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final bool obscureText;
  final bool error;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomFormInput({
    required this.labelText,
    required this.onChanged,
    this.obscureText = false,
    this.error = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RectangleBackground(
      radius: 40,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      shadowColor: error ? Colors.red : null,
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: prefixIcon ?? null,
          labelText: labelText,
          suffixIcon: suffixIcon ?? null,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
