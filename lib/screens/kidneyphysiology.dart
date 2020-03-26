import 'package:flutter/material.dart';
import 'package:physiology/widgets/formula_widget.dart';
import 'package:physiology/widgets/my_button.dart';
import 'package:physiology/widgets/my_expandable_widget.dart';
import 'package:physiology/constants.dart';
import 'package:physiology/text_controllers.dart';
import 'package:physiology/main.dart';
import 'package:physiology/formula_page.dart';

List<CardFeatures> myFormulas;

class KidneyPage extends StatefulWidget {
  @override
  _KidneyPageState createState() => _KidneyPageState();
}

class _KidneyPageState extends State<KidneyPage> {
  @override
  void initState() {
    super.initState();
    myFormulas = [
      CardFeatures(
        imageAsset: 'images/filtration.png',
        abreviationText: abreFiltration,
        context: context,
        resultText: 'Result: $resultF',
        columnWidgets: <Widget>[
          Row(
            children: <Widget>[
              textEditField(control: gfrF, labelTekst: 'GFR'),
              textEditField(control: plasmaConcF, labelTekst: '[Plasma]'),
            ],
          ),
        ],
        onPressed: () {
          double result = Formulas.filtration(
            double.parse(gfrF.text),
            double.parse(plasmaConcF.text),
          );
          setState(() {
            resultF = num.parse(result.toStringAsFixed(2));
          });
        },
      ),
      CardFeatures(
        imageAsset: 'images/excretion.png',
        abreviationText: abreExcretion,
        context: context,
        resultText: 'Result: $resultE',
        columnWidgets: <Widget>[
          Row(
            children: <Widget>[
              textEditField(control: urineFlowE, labelTekst: 'Urine Flow'),
              textEditField(control: urineConcE, labelTekst: '[Urine]'),
            ],
          ),
        ],
        onPressed: () {
          double result = Formulas.excretion(
            double.parse(urineFlowE.text),
            double.parse(urineConcE.text),
          );
          setState(() {
            resultE = num.parse(result.toStringAsFixed(2));
          });
        },
      ),
      CardFeatures(
        imageAsset: 'images/gfr.png',
        abreviationText: abreGFR,
        context: context,
        resultText: 'Result: $resultGFR',
        columnWidgets: <Widget>[
          Row(
            children: <Widget>[
              textEditField(control: urineConcGFR, labelTekst: '[Urine]'),
              textEditField(control: urineFlowGFR, labelTekst: 'Urine Flow'),
              textEditField(control: plasmaConcGFR, labelTekst: '[Plasma]'),
            ],
          ),
        ],
        onPressed: () {
          double result = Formulas.gfrInulin(
            double.parse(urineConcGFR.text),
            double.parse(urineFlowGFR.text),
            double.parse(plasmaConcGFR.text),
          );
          setState(() {
            resultGFR = num.parse(result.toStringAsFixed(2));
          });
        },
      ),
      CardFeatures(
        imageAsset: 'images/clearance.png',
        abreviationText: abreNernst,
        context: context,
        resultText: 'Result: $resultPC',
        columnWidgets: <Widget>[
          Row(
            children: <Widget>[
              textEditField(control: urineConcPC, labelTekst: '[Urine]'),
              textEditField(control: urineFlowPC, labelTekst: 'Urine Flow'),
              textEditField(control: plasmaConcPC, labelTekst: '[Plasma]'),
            ],
          ),
        ],
        onPressed: () {
          double result = Formulas.plasmaClearance(
            double.parse(urineConcPC.text),
            double.parse(urineFlowPC.text),
            double.parse(plasmaConcPC.text),
          );
          setState(() {
            resultPC = num.parse(result.toStringAsFixed(2));
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              'Kidneyphysiology',
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
                    title: 'Kidney Filtration',
                    expanded: myFormulas[0],
                  ),
                  MyExpandableWidget(
                    title: 'Kidney Excretion',
                    expanded: myFormulas[1],
                  ),
                  MyExpandableWidget(
                    title: 'GFR - Inulin',
                    expanded: myFormulas[2],
                  ),
                  MyExpandableWidget(
                    title: 'Plasma Clearance',
                    expanded: myFormulas[3],
                  ),
                  SizedBox(height: 40),
                  MyButton(
                    tag: 'kidneyTag',
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
