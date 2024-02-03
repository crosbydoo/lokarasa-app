import 'package:flutter/material.dart';

class CommonTextForm extends StatelessWidget {
  const CommonTextForm({
    super.key,
    required this.obscured,
    required this.hint,
    required this.icon,
    required this.controller,
  });

  final String hint;
  final bool obscured;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscured,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
