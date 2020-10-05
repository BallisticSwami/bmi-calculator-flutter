import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants/size_config.dart';
import 'package:bmi_calculator/constants/globals.dart';
import 'package:bmi_calculator/constants/theme.dart';
import 'results_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vibration/vibration.dart';
import 'package:bmi_calculator/services/calculator.dart';

enum Operation { add, subtract }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _buttonPressed = false;
  bool _loopActive = false;
  double opacityMale = 1;
  double opacityFemale = 0.3;

  void _increaseWeightWhilePressed(Operation operation) async {
    if (_loopActive) return;

    _loopActive = true;
    while (_buttonPressed) {
      if (weight > 9 && weight < 501) {
        setState(() {
          if (operation == Operation.add) {
            if (weight < 500) weight++;
          } else {
            if (weight > 10) weight--;
          }
        });
      }

      await Future.delayed(Duration(milliseconds: 100));
    }
    _loopActive = false;
  }

  void _increaseAgeWhilePressed(Operation operation) async {
    if (_loopActive) return;

    _loopActive = true;
    while (_buttonPressed) {
      if (age > 1 && age < 121) {
        setState(() {
          if (operation == Operation.add) {
            if (age < 120) age++;
          } else {
            if (age > 2) age--;
          }
        });
      }

      await Future.delayed(Duration(milliseconds: 100));
    }
    _loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4.8),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 2),
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onTap: () {
                      Vibration.vibrate(duration: 70);
                      setState(() {
                        if (selectedGender == Gender.male) {
                          selectedGender = Gender.female;
                          opacityMale = 0.3;
                          opacityFemale = 1;
                        } else {
                          selectedGender = Gender.male;
                          opacityMale = 1;
                          opacityFemale = 0.3;
                        }
                      });
                    },
                    cardColor: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                      opacity: opacityMale,
                      child:
                          GenderCard(icon: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onTap: () {
                      Vibration.vibrate(duration: 70);
                      setState(() {
                        if (selectedGender == Gender.female) {
                          selectedGender = Gender.male;
                          opacityMale = 1;
                          opacityFemale = 0.3;
                        } else {
                          selectedGender = Gender.female;
                          opacityMale = 0.3;
                          opacityFemale = 1;
                        }
                      });
                    },
                    cardColor: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                      opacity: opacityFemale,
                      child: GenderCard(
                          icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  )),
                ],
              ),
            )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 2),
                child: ReusableCard(
                  cardColor: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: MyThemePack.labelTextStyle,
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(height.toString(),
                              style: MyThemePack.cardNumberStyle),
                          Text(
                            'cm',
                            style: MyThemePack.labelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: MyThemePack().getMySliderTheme(context),
                        child: Slider(
                          value: height.toDouble(),
                          min: 50,
                          max: 300,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 2),
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    cardColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: MyThemePack.labelTextStyle),
                        Text(
                          weight.toString(),
                          style: MyThemePack.cardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Listener(
                              onPointerDown: (event) {
                                _buttonPressed = true;
                                _increaseWeightWhilePressed(Operation.add);
                              },
                              onPointerUp: (event) {
                                _buttonPressed = false;
                              },
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 4,
                            ),
                            Listener(
                              onPointerDown: (event) {
                                _buttonPressed = true;
                                _increaseWeightWhilePressed(Operation.subtract);
                              },
                              onPointerUp: (event) {
                                _buttonPressed = false;
                              },
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    cardColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: MyThemePack.labelTextStyle),
                        Text(
                          age.toString(),
                          style: MyThemePack.cardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Listener(
                              onPointerDown: (event) {
                                _buttonPressed = true;
                                _increaseAgeWhilePressed(Operation.add);
                              },
                              onPointerUp: (event) {
                                _buttonPressed = false;
                              },
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 4,
                            ),
                            Listener(
                              onPointerDown: (event) {
                                _buttonPressed = true;
                                _increaseAgeWhilePressed(Operation.subtract);
                              },
                              onPointerUp: (event) {
                                _buttonPressed = false;
                              },
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(
                    height: height,
                    weight: weight,
                    age: age,
                    gender: selectedGender);
                Vibration.vibrate(duration: 70);

                Navigator.push(
                    context,
                    PageTransition(
                        child: ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          feedback: calc.getFeedback(),
                          tip: calc.getTip(),
                        ),
                        type: PageTransitionType.rightToLeft,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 200)));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
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
                        topRight: Radius.circular(
                            SizeConfig.safeBlockHorizontal * 3))),
              ),
            )
          ],
        ));
  }
}
