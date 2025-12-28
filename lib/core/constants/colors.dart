import 'package:flutter/material.dart';

/// 🎨 PColors
/// A central place for managing all theme-related colors in the project.
/// 🔧 Includes:
/// - Primary, secondary, and app bar colors
/// - Background, border, and corporate branding colors
/// - Uses `withValues` for dynamic alpha adjustments
class PColors {
  // Core Colors
  static const primaryColorLight = Color(0XFF1455AC);
  static const primaryColorDark = Color(0XFF1455AC);

  static const secondaryColorLight = Color(0XFFF58300);
  static const secondaryColorDark = Color(0XFFF58300);

  // app bar
  static const appBarColorLight = Color(0XFFF58300);
  static const appBarColorDark = Color(0xFF000000);
  // nav bar
  static const nevColorLight = Color(0XFFFFFFFF);
  static const nevColorDark = Color(0xFF000000);

  // Primary Light
  static const lightColorLight = Color(0XFFE9F3FF);
  static const lightColorDark = Color(0XFFE9F3FF);

  // card color
  static const cardColorLight = Color(0XFFFFFFFF);
  static const cardColorDark = Color(0XFFFFFFFF);

  // Cancel/Negative/discount tag/ wishlist
  static const taqColorLight = Color(0XFFFF5555);
  static const taqColorDark = Color(0xFF121214);

  // cancle/Negitive background
  static const taqBackgroundColorLight = Color(0XFFFFF4F3);
  static const taqBackgroundColorDark = Color(0XFFFFF4F3);

  // warning color
  static const warningColorLight = Color(0XFFFFAD31);
  static const warningColorDark = Color(0XFFFFAD31);

  // success color
  static const successColorLight = Color(0XFF00AA6D);
  static const successColorDark = Color(0XFF00AA6D);

  // menu color
  static const menuBackgroundColorLight = Color(0XFFF8F8F9);
  static const menuBackgroundColorDark = Color(0xFF121214);

  // primary button color
  static const primaryButtonColorLight = Color(0xFF0088FF);
  static const primaryButtonColorDark = Color(0xFF0088FF);
  // primary button color
  static const secondaryButtonColorLight = Color.fromARGB(255, 20, 189, 223);
  static const secondaryButtonColorDark = Color.fromARGB(255, 54, 143, 221);

  //fill color
  static const fillColorLight = Color(0xFFFFFFFF);
  // static const fillColorDark = Color(0xFF000000);
  static const fillColorDark = Color(0xFF121214);
  static const secondaryFillColorLight = Color(0x1a0088FF);
  static const secondaryFillColorDark = Color(0xFF121214);

  // scaffold Backgrounds
  static const backGroundColorLight = Color(0XFFFCFCFC);
  static const backGroundColorDark = Color(0XFF02070E);

  // Borders
  static final borderColorLight = Color(0xFFFFFFFF);
  static final borderColorDark = Color(0xFF2B2B2B);

  // Divider Colors/
  static final dividerColorLight = Color(0xFFFFFFFF);
  static final dividerColorDark = Color(0xFF171717);

  // Text Colors
  static const primayTextColorLight = Color(0XFF1C1E20);
  static const primayTextColorDark = Color(0XFFFCFCFC);
  static const secondaryTextColorLight = Color(0XFF595959);
  static const secondaryTextColorDark = Color(0XFF595959);
  static const deactiveTextColorLight = Color(0xFFAFB1B5);
  static const deactiveTextColorDark = Color(0XFFAFB1B5);
  static const categorySideBarColorLight = Color(0x2BAFB1B5);
  static const categorySideBarColorDark = Color(0X2BAFB1B5);

  // image filter color
  static Gradient imageFG = LinearGradient(
    begin: Alignment.bottomCenter, // start at bottom
    end: Alignment.topCenter,
    stops: [0.05, 0.1, 0.2, 1],
    // transform: GradientRotation(4),
    colors: [
      Colors.black, // bottom color
      Colors.black.withAlpha(50), // bottom color
      Colors.transparent, // top color
      Colors.transparent, // top color
    ],
  );

  static var proLinearGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xFF01FD8C), Color(0xFF2FDFFF)],
  );

  // indicator color,
  // static const pendingColor = Color(0xFFA8986B);
  // static const timeoutColor = Colors.red;
  // static const completedColor = Color(0xff004d4d);
}
