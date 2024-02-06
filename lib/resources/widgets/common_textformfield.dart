import 'package:flutter/material.dart';

class CommonTextForm extends StatelessWidget {
  const CommonTextForm({
    super.key,
    required this.obscured,
    required this.hint,
    this.icon,
    this.controller,
  });

  final String hint;
  final bool obscured;
  final IconData? icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscured,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
