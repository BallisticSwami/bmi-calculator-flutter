import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/constants/theme.dart';

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
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child);
      },
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: InputPage(),
    );
  }
}
