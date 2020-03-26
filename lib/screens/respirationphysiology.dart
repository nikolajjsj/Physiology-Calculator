import 'package:flutter/material.dart';
import 'package:physiology/widgets/formula_widget.dart';
import 'package:physiology/widgets/my_button.dart';
import 'package:physiology/widgets/my_expandable_widget.dart';
import 'package:physiology/constants.dart';
import 'package:physiology/formula_page.dart';
import 'package:physiology/text_controllers.dart';
import 'package:physiology/main.dart';
import 'dart:math' as prefix0;
import 'package:fl_chart/fl_chart.dart';

//my flspot dataset
List<FlSpot> myData = [FlSpot(0, 0)];

class RespirationPage extends StatefulWidget {
  @override
  _RespirationPageState createState() => _RespirationPageState();
}

class _RespirationPageState extends State<RespirationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              'Respirationphysiology',
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
                    title: 'Cardiac Output',
                    expanded: CardFeatures(
                      imageAsset: 'images/cardiacoutput.png',
                      abreviationText: abreCardiacOutput,
                      context: context,
                      resultText: 'Result: $resultCO mL/min',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: heartRateCO,
                                labelTekst: 'Heart Rate',
                                suffixTekst: 'beats/min'),
                            textEditField(
                                control: strokeVolumeCO,
                                labelTekst: 'Stroke Volume',
                                suffixTekst: 'mL'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double result = Formulas.cardiacOutput(
                          double.parse(heartRateCO.text),
                          double.parse(strokeVolumeCO.text),
                        );
                        setState(() {
                          resultCO = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Stroke Volume',
                    expanded: CardFeatures(
                      imageAsset: 'images/strokevolume.png',
                      abreviationText: abreStrokeVolume,
                      context: context,
                      resultText: 'Result: $resultSV mL',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: diastolicVolumeSV,
                                labelTekst: 'Diastolic Volume',
                                suffixTekst: 'mL'),
                            textEditField(
                                control: systolicVolumeSV,
                                labelTekst: 'Systolic Volume',
                                suffixTekst: 'mL'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double result = Formulas.strokeVolume(
                          double.parse(diastolicVolumeSV.text),
                          double.parse(systolicVolumeSV.text),
                        );
                        setState(() {
                          resultSV = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Oxygen Transport',
                    expanded: CardFeatures(
                      imageAsset: 'images/oxygentransport.png',
                      abreviationText: abreOxygenTransport,
                      context: context,
                      resultText: 'Result: $resultOT mL/min',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: heartRateOT,
                                labelTekst: 'Heart Rate',
                                suffixTekst: 'beats/min'),
                            textEditField(
                                control: strokeVolumeOT,
                                labelTekst: 'Stroke Volume',
                                suffixTekst: 'mL'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: caO2OT,
                                labelTekst: 'CaO2',
                                suffixTekst: 'mL/dL'),
                            textEditField(
                                control: cvO2OT,
                                labelTekst: 'CvO2',
                                suffixTekst: 'mL/dL'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double result = Formulas.oxygenTransport(
                          double.parse(heartRateOT.text),
                          double.parse(strokeVolumeOT.text),
                          double.parse(caO2OT.text),
                          double.parse(cvO2OT.text),
                        );
                        setState(() {
                          resultOT = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Carbon Dioxide Transport',
                    expanded: CardFeatures(
                      imageAsset: 'images/co2transport.png',
                      abreviationText: abreCO2Transport,
                      context: context,
                      resultText: 'Result: $resultCT mL/min',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: heartRateCT,
                                labelTekst: 'Heart Rate',
                                suffixTekst: 'beats/min'),
                            textEditField(
                                control: strokeVolumeCT,
                                labelTekst: 'Stroke Volume',
                                suffixTekst: 'mL'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: caCO2CT,
                                labelTekst: 'CaCO2',
                                suffixTekst: 'mL/dL'),
                            textEditField(
                                control: cvCO2CT,
                                labelTekst: 'CvCO2',
                                suffixTekst: 'mL/dL'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double result = Formulas.carbonTransport(
                          double.parse(heartRateCT.text),
                          double.parse(strokeVolumeCT.text),
                          double.parse(caCO2CT.text),
                          double.parse(cvCO2CT.text),
                        );
                        setState(() {
                          resultCT = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Oxygen per Pulsebeat',
                    expanded: CardFeatures(
                      imageAsset: 'images/iltpuls.png',
                      abreviationText: abreOxygenPerPulsebeat,
                      context: context,
                      resultText: 'Result: $resultOPP mL',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: strokeVolumeOPP,
                                labelTekst: 'Stroke Volume',
                                suffixTekst: 'mL'),
                            textEditField(
                                control: caO2OPP,
                                labelTekst: 'CaO2',
                                suffixTekst: 'mL/dL'),
                            textEditField(
                                control: cvO2OPP,
                                labelTekst: 'CvO2',
                                suffixTekst: 'mL/dL'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double result = Formulas.oxygenPerPulsebeat(
                          double.parse(strokeVolumeOPP.text),
                          double.parse(caO2OPP.text),
                          double.parse(cvO2OPP.text),
                        );
                        setState(() {
                          resultOPP = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Mean Arterial Pressure 1',
                    expanded: CardFeatures(
                      imageAsset: 'images/map1.png',
                      abreviationText: abreMAP1,
                      context: context,
                      resultText: 'Result: $resultMAP1 mmHg',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: systolicPressureMAP1,
                                labelTekst: 'Systolic Pressure',
                                suffixTekst: 'mmHg'),
                            textEditField(
                                control: diastolicPressureMAP1,
                                labelTekst: 'Diastolic Pressure',
                                suffixTekst: 'mmHg'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double result = Formulas.map1(
                          double.parse(systolicPressureMAP1.text),
                          double.parse(diastolicPressureMAP1.text),
                        );
                        setState(() {
                          resultMAP1 = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Mean Arterial Pressure 2',
                    expanded: CardFeatures(
                      imageAsset: 'images/map2.png',
                      abreviationText: abreMAP2,
                      context: context,
                      resultText: 'Result: $resultMAP2 mmHg',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: strokeVolumeMAP2,
                                labelTekst: 'Stroke Volume',
                                suffixTekst: 'mL'),
                            textEditField(
                                control: heartRateMAP2,
                                labelTekst: 'Heart Rate',
                                suffixTekst: 'beats/min'),
                            textEditField(
                                control: tprMAP2,
                                labelTekst: 'TPR',
                                suffixTekst: 'mmHg'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double result = Formulas.map2(
                          double.parse(strokeVolumeMAP2.text),
                          double.parse(heartRateMAP2.text),
                          double.parse(tprMAP2.text),
                        );
                        setState(() {
                          resultMAP2 = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Oxygen Saturation',
                    expanded: CardFeatures(
                      context: context,
                      abreviationText: abreOxygenSaturation,
                      imageAsset: 'images/blood.jpg',
                      resultText: 'Result: $resultOS',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: partialPressureOS,
                                labelTekst: 'Partial pressure of Oxygen'),
                            textEditField(
                                control: oxygenSaturationOS,
                                labelTekst: 'Oxygen p50'),
                            textEditField(
                                control: nValueOS, labelTekst: 'n - Value'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double partialOxygen;
                        partialOxygen =
                            double.parse((partialPressureOS.text).toString());
                        double oxygenSaturation;
                        oxygenSaturation =
                            double.parse((oxygenSaturationOS.text).toString());
                        double nValue;
                        nValue = double.parse((nValueOS.text).toString());
                        //formula
                        double result = (prefix0.pow(partialOxygen, nValue)) /
                            ((prefix0.pow(oxygenSaturation, nValue)) +
                                (prefix0.pow(partialOxygen, nValue)));
                        //updates the _resultOS value with calculates result value
                        setState(() {
                          resultOS = num.parse(
                            result.toStringAsFixed(3),
                          );
                          myData.clear();
                          for (var i = 0.0; i < 100; i++) {
                            myData.add(
                              FlSpot(
                                i,
                                double.parse(
                                  ((prefix0.pow(i, nValue)) /
                                          (prefix0.pow(
                                                  oxygenSaturation, nValue) +
                                              prefix0.pow(i, nValue)))
                                      .toStringAsFixed(3),
                                ),
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  MyButton(
                    tag: 'ventilationTag',
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
