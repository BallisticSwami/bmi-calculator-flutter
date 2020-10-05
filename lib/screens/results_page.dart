import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants/size_config.dart';
import 'package:bmi_calculator/constants/globals.dart';
import 'package:bmi_calculator/constants/theme.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.feedback,
      @required this.tip});

  final String bmiResult;
  final String resultText;
  final String feedback;
  final String tip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4.8),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              'Your Result',
              style: MyThemePack.titleTextStyle,
              textAlign: TextAlign.center,
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText, style: MyThemePack.resultTextStyle),
                  Text(
                    bmiResult,
                    style: MyThemePack.bmiTextStyle,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 8),
                        child: Text(
                          feedback,
                          style: MyThemePack.bmiInfoTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Visibility(
                        visible: tip == 'null' ? false : true,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal*1.3)),
                          color: Colors.white.withOpacity(0),
                          elevation: 0,
                          highlightElevation: 0,
                          splashColor: Colors.white.withOpacity(0.1),
                          highlightColor: Colors.white.withOpacity(0.05),
                          onPressed: () {
                            showAnimatedDialog(
                              animationType: DialogTransitionType.scale,
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 250),
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: activeCardColor,
                                    title: Text('Disclaimer'),
                                    content: Text(tip, style: TextStyle(color: Colors.white.withOpacity(0.6)),),
                                    actions: [FlatButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text('OK', style: TextStyle(
                                      fontSize: SizeConfig.safeBlockHorizontal*4,
                                      letterSpacing: SizeConfig.safeBlockHorizontal*0.5,
                                      color: accentButton
                                    ),))],
                                  );
                                });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Tip',
                                style: TextStyle(color: cardButtonColor),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 1,
                              ),
                              Icon(
                                Icons.help_outline,
                                color: cardButtonColor,
                                size: SizeConfig.safeBlockHorizontal * 4,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Vibration.vibrate(duration: 70);
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: MyThemePack.largeButtonTextStyle,
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: SizeConfig.safeBlockVertical * 8.7,
              decoration: BoxDecoration(
                  color: accentButton,
                  borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(SizeConfig.safeBlockHorizontal * 3),
                      topRight:
                          Radius.circular(SizeConfig.safeBlockHorizontal * 3))),
            ),
          )
        ],
      ),
    );
  }
}
