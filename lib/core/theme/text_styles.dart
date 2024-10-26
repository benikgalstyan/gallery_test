import 'package:flutter/material.dart';
import 'package:gallery_test/core/theme/palette.dart';

abstract class TextStyles {
  static TextStyle get mainTextStyle => const TextStyle(
        color: Palette.greyTextColor,
        fontSize: 12,
      );

  static TextStyle get secondaryTextStyle => const TextStyle(
        fontSize: 16,
        color: Colors.white,
      );
}
