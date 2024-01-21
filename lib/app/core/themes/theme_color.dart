import 'dart:math';

import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const Color backgroundColor = Color(0xff1A1A1A);

  // Primary Shades
  // static const Color primary = Color(0xff24B4B3);
  static const Color oceanDark = Color(0xff00464F);
  // static const Color primaryEmphasis = Color(0xff046270);
  // static const Color primaryAlt = Color(0xff4FCCBE);
  // static const Color primaryLight = Color(0xff80E1D7);
  // static const Color primaryLight2 = Color(0xff86E6E6);
  // static const Color primaryExtraLight = Color(0xffA8E8E5);
  // static const Color primaryFade1 = Color(0xffD6FFF1);
  // static const Color primaryFade2 = Color(0xffE1FFFF);

  // Secondary Shades
  static const Color secondary = Color(0xffEF7875);
  static const Color secondaryDark = Color(0xffDD4D54);
  static const Color secondaryEmphasis = Color(0xffE86F6F);
  static const Color secondaryAlt = Color(0xffFA8987);
  static const Color secondaryLight = Color(0xffFFA796);
  static const Color secondaryExtraLight = Color(0xffFFCDC4);
  static const Color secondaryFade = Color(0xffFFECE9);
  static const Color secondaryRed = Color(0xffFF454E);

  // Mono Shades
  static const Color mono = Color(0xff000000);
  static const Color monoDark = Color(0xff061E1E);
  static const Color monoEmphasis = Color(0xff1E262C);
  static const Color monoAlt = Color(0xff49565F);
  static const Color monoLight = Color(0xff586767);
  static const Color monoExtraLight = Color(0xffC4D3D3);
  static const Color monoFade = Color(0xffE9F8F8);
  static const Color monoFade2 = Color(0xffEDF2F2);
  static const Color monoWhite = Color(0xffFFFFFF);
  static const Color monoGrey3 = Color(0xff969696);

  static const Color tertiary = Color(0xffEDBF55);

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
        tintValue(color.red, factor),
        tintValue(color.green, factor),
        tintValue(color.blue, factor),
        1,
      );

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
        shadeValue(color.red, factor),
        shadeValue(color.green, factor),
        shadeValue(color.blue, factor),
        1,
      );
}
