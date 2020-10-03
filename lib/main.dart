import 'package:flutter/material.dart';
import 'input_page.dart';
import 'size_config.dart';
import 'theme.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(        
      theme: myTheme,                                    
      home: InputPage(),                        
    );
  }
}

