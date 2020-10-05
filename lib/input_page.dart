import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'size_config.dart';
import 'globals.dart';
import 'theme.dart';

enum Gender { male, female }
enum Operation { add, subtract }

Gender selectedGender = Gender.male;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _buttonPressed = false;
  bool _loopActive = false;

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

      await Future.delayed(Duration(milliseconds: 80));
    }
    _loopActive = false;
  }

void _increaseAgeWhilePressed(Operation operation) async {
    if (_loopActive) return;

    _loopActive = true;
    while (_buttonPressed) {
      if (age > 0 && age < 121) {
        setState(() {
          if (operation == Operation.add) {
            if (age < 120) age++;
          } else {
            if (age > 1) age--;
          }
        });
      }

      await Future.delayed(Duration(milliseconds: 90));
    }
    _loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
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
                      setState(() {
                        if (selectedGender == Gender.male) {
                          selectedGender = Gender.female;
                        } else {
                          selectedGender = Gender.male;
                        }
                      });
                    },
                    cardColor: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild:
                        GenderCard(icon: FontAwesomeIcons.mars, text: 'MALE'),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onTap: () {
                      setState(() {
                        if (selectedGender == Gender.female) {
                          selectedGender = Gender.male;
                        } else {
                          selectedGender = Gender.female;
                        }
                      });
                    },
                    cardColor: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: GenderCard(
                        icon: FontAwesomeIcons.venus, text: 'FEMALE'),
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
            Container(
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
            )
          ],
        ));
  }
}
