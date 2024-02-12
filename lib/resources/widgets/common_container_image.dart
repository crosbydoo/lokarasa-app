import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.imagePath,
    this.height = 150,
    required this.width,
    this.borderRadius = 20,
    this.padding,
    this.margin,
    this.child,
  });
  final String imagePath;
  final double height;
  final double width;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius!),
          topRight: Radius.circular(borderRadius!),
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
