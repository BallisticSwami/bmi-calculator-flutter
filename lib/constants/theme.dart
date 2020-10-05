import 'package:flutter/material.dart';
import 'size_config.dart';
import 'globals.dart';

ThemeData myTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: bgColor,
  scaffoldBackgroundColor: bgColor,
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

  static TextStyle largeButtonTextStyle = TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 6.3,
      fontWeight: FontWeight.w800,
      color: bgColor);

  static TextStyle cardNumberStyle = TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 14,
      fontWeight: FontWeight.w900);

  SliderThemeData getMySliderTheme(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: SizeConfig.safeBlockHorizontal * 2.7),
      overlayShape: RoundSliderOverlayShape(
          overlayRadius: SizeConfig.safeBlockHorizontal * 6),
      overlayColor: Color(0x29EE4266),
      activeTrackColor: Color(0xffEE4266),
      inactiveTrackColor: Color(0xff3c3e5c),
      thumbColor: Color(0xffEE4266),
    );
  }

  // for 2nd page
  static TextStyle titleTextStyle = TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 11,
    fontWeight: FontWeight.bold,
  );

  static TextStyle resultTextStyle = TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4.3,
    fontWeight: FontWeight.bold,
    letterSpacing: SizeConfig.safeBlockHorizontal * 0.5,
    color: Color(0xff24d876),
  );

  static TextStyle bmiTextStyle = TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 21,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bmiInfoTextStyle = TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4.4,
  );
}
