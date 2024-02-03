import 'package:flutter/material.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool outlined;

  const CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.outlined = false,
  }) : super(key: key);

  factory CommonButton.normalButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) {
    return CommonButton(
      key: key,
      text: text,
      onPressed: onPressed,
    );
  }

  factory CommonButton.outlinedButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) {
    return CommonButton(
      key: key,
      text: text,
      onPressed: onPressed,
      outlined: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: outlined ? Colors.white : Colors.blue,
          side: outlined ? const BorderSide(color: Colors.blue) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            style: StyleTypograph.label1.medium.copyWith(
              color: outlined ? Colors.blue : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
