import 'package:flutter/material.dart';
import 'size_config.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(child: ReusableCard(cardColor: Color(0xff1D1E33))),
                Expanded(child: ReusableCard(cardColor: Color(0xff1D1E33))),
              ],
            )),
            Expanded(
                child: Container(
              margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
              decoration: BoxDecoration(
                  color: Color(0xff1D1E33),
                  borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockHorizontal * 3)),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(child: ReusableCard(cardColor: Color(0xff1D1E33))),
                Expanded(child: ReusableCard(cardColor: Color(0xff1D1E33))),
              ],
            )),
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.cardColor});

  Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3)),
    );
  }
}
