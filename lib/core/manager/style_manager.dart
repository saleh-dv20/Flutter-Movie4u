import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(Color color, FontWeight fontWeight, double fontSize ) {
  return TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize);
}

// ragular Stule
TextStyle getRagularStyle(
    {double fontSize = FontSizeManager.s15, required Color color}) {
  return _getTextStyle(color, FontWeightManager.ragular, fontSize);
}

// bold Style
TextStyle getBoldStyle(
    {double fontSize = FontSizeManager.s15, required Color color}) {
  return _getTextStyle(color, FontWeightManager.bold, fontSize , );
}

// nrmal Style
TextStyle getNormalStyle(
    {double fontSize = FontSizeManager.s15, required Color color}) {
  return _getTextStyle(color, FontWeightManager.normal, fontSize);
}


// seamiaBold
TextStyle getSeamBoldlStyle(
    {double fontSize = FontSizeManager.s15, required Color color}) {
  return _getTextStyle(color, FontWeightManager.seamiaBold, fontSize);
}
