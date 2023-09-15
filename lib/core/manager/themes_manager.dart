import 'package:cima_movies_clean/core/manager/style_manager.dart';
import 'package:flutter/material.dart';

import 'colors_manager.dart';
import 'font_manager.dart';

// ignore: non_constant_identifier_names
ThemeData themeManager() {
  return ThemeData(
    // Background Color
    scaffoldBackgroundColor: ColorManager.darkGrey,
    // Text Theme
    textTheme: TextTheme(
      //headLin
      headlineSmall: getRagularStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s15,
      ),
      headlineMedium: getRagularStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s20,
      ),
      bodySmall: getNormalStyle(
        color: ColorManager.whiteGreu,
        fontSize: FontSizeManager.s13_6,
      ),
      bodyMedium: getNormalStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s15,
      ),
      titleMedium: getBoldStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s12),
      titleLarge: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s15,
      ),
    ),
  );
}
// TODO : No theme in details screen line 114 ...