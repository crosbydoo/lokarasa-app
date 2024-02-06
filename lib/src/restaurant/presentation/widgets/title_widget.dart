import 'package:flutter/material.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
  });
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: StyleTypograph.body1.regular.copyWith(color: Colors.white),
      ),
    );
  }
}
