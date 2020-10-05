import 'package:flutter/material.dart';
import 'size_config.dart';
import 'globals.dart';

ThemeData myTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: Color(0xff0a0e21),
  scaffoldBackgroundColor: Color(0xff0a0e21),
);

class MyThemePack {
  static double safeBlockHz;
  static double safeBlockVt;

  void initBlock(BuildContext context) {
    SizeConfig().init(context);
    safeBlockHz = SizeConfig.safeBlockHorizontal;
    safeBlockVt = SizeConfig.safeBlockVertical;
  }

  static TextStyle labelTextStyle = TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4.2,
    color: cardTextColor,
  );

  static TextStyle cardNumberStyle = TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 14,
      fontWeight: FontWeight.w900);

  SliderThemeData getMySliderTheme(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: SizeConfig.safeBlockHorizontal * 2.7),
        overlayShape: RoundSliderOverlayShape(overlayRadius: SizeConfig.safeBlockHorizontal * 6),
        overlayColor: Color(0x29EE4266),
        activeTrackColor: Color(0xffEE4266),
        inactiveTrackColor: Color(0xff3c3e5c),
        thumbColor: Color(0xffEE4266),
    );
  }
}
