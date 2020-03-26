import 'package:flutter/material.dart';
import 'package:physiology/constants.dart';
import 'package:physiology/formula_page.dart';
import 'package:physiology/widgets/formula_widget.dart';
import 'package:physiology/widgets/my_expandable_widget.dart';
import 'package:physiology/text_controllers.dart';
import 'package:physiology/main.dart';
import 'package:physiology/widgets/my_button.dart';

class NeurophysiologyPage extends StatefulWidget {
  @override
  _NeurophysiologyPageState createState() => _NeurophysiologyPageState();
}

class _NeurophysiologyPageState extends State<NeurophysiologyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              'Neurophysiology',
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
                    title: 'Goldman equation',
                    expanded: CardFeatures(
                      imageAsset: 'images/goldman.png',
                      abreviationText: abreGoldman,
                      context: context,
                      resultText: 'Result: $resultGoldman mV',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kExtra,
                                labelTekst: '[K]e',
                                suffixTekst: 'mM'),
                            textEditField(
                                control: naExtra,
                                labelTekst: '[Na]e',
                                suffixTekst: 'mM'),
                            textEditField(
                                control: clIntra,
                                labelTekst: '[Cl]i',
                                suffixTekst: 'mM'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kIntra,
                                labelTekst: '[K]i',
                                suffixTekst: 'mM'),
                            textEditField(
                                control: naIntra,
                                labelTekst: '[Na]i',
                                suffixTekst: 'mM'),
                            textEditField(
                                control: clExtra,
                                labelTekst: '[Cl]e',
                                suffixTekst: 'mM'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: kPerm, labelTekst: 'K-permeability'),
                            textEditField(
                                control: naPerm, labelTekst: 'Na-permeability'),
                            textEditField(
                                control: clPerm, labelTekst: 'Cl-permeability'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: vmTemp,
                                labelTekst: 'Temperature',
                                suffixTekst: 'Kelvin'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double pK, pNa, pCl;
                        double kOut, kIn, naOut, naIn, clOut, clIn;
                        double temperature =
                            double.parse((vmTemp.text).toString());
                        pK = double.parse((kPerm.text).toString());
                        pNa = double.parse((naPerm.text).toString());
                        pCl = double.parse((clPerm.text).toString());
                        kOut = double.parse((kExtra.text).toString());
                        kIn = double.parse((kIntra.text).toString());
                        naOut = double.parse((naExtra.text).toString());
                        naIn = double.parse((naIntra.text).toString());
                        clOut = double.parse((clExtra.text).toString());
                        clIn = double.parse((clIntra.text).toString());
                        double result = Formulas.goldman(temperature, pK, pNa,
                            pCl, kOut, kIn, naOut, naIn, clOut, clIn);
                        setState(() {
                          resultGoldman = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Nernst Potential',
                    expanded: CardFeatures(
                      imageAsset: 'images/nernst.png',
                      abreviationText: abreNernst,
                      context: context,
                      resultText: 'Result: $resultNernst mV',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: ionExtra,
                                labelTekst: '[Ion]e',
                                suffixTekst: 'mM'),
                            textEditField(
                                control: ionIntra,
                                labelTekst: '[Ion]i',
                                suffixTekst: 'mM'),
                            textEditField(
                                control: nernstTemp,
                                labelTekst: 'Temp. in Kelvin'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double result = Formulas.nernst(
                            double.parse(ionExtra.text),
                            double.parse(ionIntra.text),
                            double.parse(nernstTemp.text),
                          );
                          resultNernst = num.parse(
                            result.toStringAsFixed(2),
                          );
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Ohms Law',
                    expanded: CardFeatures(
                      imageAsset: 'images/ohm.png',
                      abreviationText: abreOhms,
                      context: context,
                      resultText: 'Result: $resultOL',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: voltageOL, labelTekst: 'Voltage'),
                            textEditField(
                                control: resistanceOL,
                                labelTekst: 'Resistance'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        double result = Formulas.ohmsLaw(
                          double.parse(voltageOL.text),
                          double.parse(resistanceOL.text),
                        );
                        setState(() {
                          resultOL = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Length Constant',
                    expanded: CardFeatures(
                      imageAsset: 'images/length_constant.png',
                      abreviationText: abreLengthConstant,
                      context: context,
                      resultText: 'Result: $resultLC',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: rmLC,
                                labelTekst: 'Membrane Resistance'),
                            textEditField(
                                control: raLC, labelTekst: 'Serial Resistance'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double result = Formulas.lengthConstant(
                            double.parse(rmLC.text),
                            double.parse(raLC.text),
                          );
                          setState(() {
                            resultLC = num.parse(result.toStringAsFixed(2));
                          });
                        });
                      },
                    ),
                  ),
                  MyExpandableWidget(
                    title: 'Time Constant',
                    expanded: CardFeatures(
                      imageAsset: 'images/time_constant.png',
                      abreviationText: abreLengthConstant,
                      context: context,
                      resultText: 'Result: $resultTC',
                      columnWidgets: <Widget>[
                        Row(
                          children: <Widget>[
                            textEditField(
                                control: rmTC,
                                labelTekst: 'Membrane Resistance'),
                            textEditField(
                                control: cmTC,
                                labelTekst: 'Membrane Capacitance'),
                          ],
                        ),
                      ],
                      onPressed: () {
                        setState(() {
                          double result = Formulas.timeConstant(
                            double.parse(rmTC.text),
                            double.parse(cmTC.text),
                          );
                          resultTC = num.parse(result.toStringAsFixed(2));
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  MyButton(
                    tag: 'neuroTag',
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
