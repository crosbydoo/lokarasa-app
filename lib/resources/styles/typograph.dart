import 'package:flutter/material.dart';

class Typograph {
  Typograph({
    required this.light,
    required this.regular,
    required this.medium,
    required this.bold,
    required this.black,
  });

  final TextStyle light;
  final TextStyle regular;
  final TextStyle medium;
  final TextStyle bold;
  final TextStyle black;
}

class StyleTypograph {
  static const String _fontLight = 'PoppinsLight';
  static const String _fontRegular = 'PoppinsRegular';
  static const String _fontMedium = 'PoppinsMedium';
  static const String _fontBold = 'PoppinsBold';
  static const String _fontBlack = 'PoppinsBlack';

  //* Heading 1
  static Typograph heading1 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Heading 2
  static Typograph heading2 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Heading 3
  static Typograph heading3 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Label 1
  static Typograph label1 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Label 2
  static Typograph label2 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Label 3
  static Typograph label3 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Body 1
  static Typograph body1 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Body 2
  static Typograph body2 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Body 3
  static Typograph body3 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w900,
    ),
  );

  //* Body 4
  static Typograph body4 = Typograph(
    light: const TextStyle(
      fontFamily: _fontLight,
      fontSize: 10,
      height: 14 / 10,
      fontWeight: FontWeight.w300,
    ),
    regular: const TextStyle(
      fontFamily: _fontRegular,
      fontSize: 10,
      height: 14 / 10,
      fontWeight: FontWeight.w400,
    ),
    medium: const TextStyle(
      fontFamily: _fontMedium,
      fontSize: 10,
      height: 14 / 10,
      fontWeight: FontWeight.w500,
    ),
    bold: const TextStyle(
      fontFamily: _fontBold,
      fontSize: 10,
      height: 14 / 10,
      fontWeight: FontWeight.w700,
    ),
    black: const TextStyle(
      fontFamily: _fontBlack,
      fontSize: 10,
      height: 14 / 10,
      fontWeight: FontWeight.w900,
    ),
  );
}
