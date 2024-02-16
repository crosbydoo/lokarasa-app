import 'package:flutter/material.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool outlined;
  final bool disabled; // New property for button disabled state

  const CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.outlined = false,
    this.disabled = false, // Default value is false (button is enabled)
  });

  factory CommonButton.normalButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    bool disabled = false, // New parameter with default value
  }) {
    return CommonButton(
      key: key,
      text: text,
      onPressed: onPressed,
      disabled:
          disabled, // Assign the disabled parameter to the disabled property
    );
  }

  factory CommonButton.outlinedButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    bool disabled = false, // New parameter with default value
  }) {
    return CommonButton(
      key: key,
      text: text,
      onPressed: onPressed,
      outlined: true,
      disabled:
          disabled, // Assign the disabled parameter to the disabled property
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: disabled
            ? null
            : onPressed, // Disable the button if disabled is true
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
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
