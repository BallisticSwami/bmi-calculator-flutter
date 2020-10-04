import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:flutter/services.dart';
import 'theme.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment=false;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffEE4266),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: InputPage(),
    );
  }
}
