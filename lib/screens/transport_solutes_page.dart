import 'package:flutter/material.dart';
import 'package:physiology/constants.dart';
import 'package:physiology/widgets/formula_widget.dart';
import 'package:physiology/widgets/my_expandable_widget.dart';
import 'package:physiology/text_controllers.dart';
import 'package:physiology/main.dart';
import 'package:physiology/widgets/my_button.dart';

class SolutesPage extends StatefulWidget {
  @override
  _NeurophysiologyPageState createState() => _NeurophysiologyPageState();
}

class _NeurophysiologyPageState extends State<SolutesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              'Transport of Solutes and Water',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  MyExpandableWidget(
                    title: 'Fick\'s Law',
                    expanded: CardFeatures(
                      imageAsset: 'images/fick.png',
                      abreviationText: abreFick,
                      context: context,
                      resultText: 'Result: $fickResult',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kHoejKoncentration, labelTekst: 'C1'),
                            textEditField(
                                control: kLavKoncentration, labelTekst: 'C2'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kDiffusion,
                                labelTekst: 'Diffusioncoefficient'),
                            textEditField(
                                control: kAfstand, labelTekst: 'Distance'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double c1 = double.parse(
                              (kHoejKoncentration.text).toString());
                          double c2 =
                              double.parse((kLavKoncentration.text).toString());
                          double d = double.parse((kDiffusion.text).toString());
                          double x = double.parse((kAfstand.text).toString());
                          double result = d * ((c1 - c2) / x);
                          fickResult = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Osmotic Pressure',
                    expanded: CardFeatures(
                      imageAsset: 'images/osmotisk_tryk.png',
                      abreviationText: abreOsmotiskTryk,
                      context: context,
                      resultText: 'Result: $osmoticPressureResult',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kTemperatur,
                                labelTekst: 'T',
                                suffixTekst: 'Kelvin'),
                            textEditField(
                                control: kKoncentrationOploest,
                                labelTekst: 'C'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double t = double.parse((kTemperatur.text).toString());
                          double c = double.parse((kKoncentrationOploest.text).toString());
                          double result = 8.145 * t * c;
                          osmoticPressureResult =
                              num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Osmotic Rate',
                    expanded: CardFeatures(
                      imageAsset: 'images/osmose_rate.png',
                      abreviationText: abreFick,
                      context: context,
                      resultText: 'Result: $osmoseRateResult',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kOsmoticPressureC1, labelTekst: 'π1'),
                            textEditField(
                                control: kOsmoticPressureC2, labelTekst: 'π2'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kProportionalityConstant,
                                labelTekst: 'Proportionality constant'),
                            textEditField(
                                control: kOsmoticDistance, labelTekst: 'Distance'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double pi1 = double.parse(
                              (kOsmoticPressureC1.text).toString());
                          double pi2 =
                              double.parse((kOsmoticPressureC2.text).toString());
                          double k = double.parse((kProportionalityConstant.text).toString());
                          double x = double.parse((kOsmoticDistance.text).toString());
                          double result = k * ((pi1 - pi2)/x);
                          osmoseRateResult = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  MyButton(
                    tag: 'transportTag',
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
