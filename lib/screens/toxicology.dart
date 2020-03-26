import 'package:flutter/material.dart';
import 'package:physiology/widgets/formula_widget.dart';
import 'package:physiology/widgets/my_button.dart';
import 'package:physiology/widgets/my_expandable_widget.dart';
import 'package:physiology/constants.dart';
import 'package:physiology/text_controllers.dart';
import 'package:physiology/main.dart';
import 'dart:math' as prefix0;

class ToxicologyPage extends StatefulWidget {
  @override
  _ToxicologyPageState createState() => _ToxicologyPageState();
}

class _ToxicologyPageState extends State<ToxicologyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              'Toxicology',
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
                    title: 'Half Life',
                    expanded: CardFeatures(
                      imageAsset: 'images/halflife.png',
                      abreviationText: abreHalfLife,
                      context: context,
                      resultText:
                          'Result: ${halfLifeResult.toStringAsFixed(2)}',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kEl, labelTekst: 'Kel per hour'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double kelValue = double.parse(
                            (kEl.text).toString(),
                          );
                          halfLifeResult = 0.693 / kelValue;
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Chemical Distribution',
                    expanded: CardFeatures(
                      imageAsset: 'images/chemicaldistribution.png',
                      abreviationText: abreHalfLife,
                      context: context,
                      resultText:
                          'Result: ${chemicalResult.toStringAsFixed(2)} liter',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                              control: dose,
                              labelTekst: 'Dose in mg',
                            ),
                            textEditField(
                              control: plasmaConcentration,
                              labelTekst: '[Plasma] in mg/L',
                            ),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double doseValue = double.parse(
                            (dose.text).toString(),
                          );
                          double plasmaConcentrationValue = double.parse(
                            (plasmaConcentration.text).toString(),
                          );
                          chemicalResult = doseValue / plasmaConcentrationValue;
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'pH - weak acid',
                    expanded: CardFeatures(
                      imageAsset: 'images/phweakacid.png',
                      abreviationText: abrePhWeakAcid,
                      context: context,
                      resultText:
                          'Result: ${phWeakAcidResult.toStringAsFixed(2)}',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                              control: pKaWeakAcid,
                              labelTekst: 'pKa',
                            ),
                            textEditField(
                              control: aWeakAcid,
                              labelTekst: 'A-',
                            ),
                            textEditField(
                              control: haWeakAcid,
                              labelTekst: 'HA',
                            ),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double pkaValue = double.parse(
                            (pKaWeakAcid.text).toString(),
                          );
                          double aValue = double.parse(
                            (aWeakAcid.text).toString(),
                          );
                          double haValue = double.parse(
                            (haWeakAcid.text).toString(),
                          );
                          phWeakAcidResult =
                              pkaValue + prefix0.log((aValue) / (haValue));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'pH - weak base',
                    expanded: CardFeatures(
                      imageAsset: 'images/phweakbase.png',
                      abreviationText: abrePhWeakAcid,
                      context: context,
                      resultText:
                          'Result: ${phWeakBaseResult.toStringAsFixed(2)}',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                              control: pKaWeakBase,
                              labelTekst: 'pKa',
                            ),
                            textEditField(
                              control: aWeakBase,
                              labelTekst: 'B-',
                            ),
                            textEditField(
                              control: haWeakBase,
                              labelTekst: 'HB+',
                            ),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double pkaValue2 = double.parse(
                            (pKaWeakBase.text).toString(),
                          );
                          double bValue = double.parse(
                            (aWeakBase.text).toString(),
                          );
                          double hbValue = double.parse(
                            (haWeakBase.text).toString(),
                          );
                          phWeakBaseResult =
                              pkaValue2 + prefix0.log((bValue) / (hbValue));
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  MyButton(
                    tag: 'toxicologyTag',
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
