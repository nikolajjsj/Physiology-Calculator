import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'abreviation_button.dart';
import 'package:physiology/main.dart';
import 'package:physiology/theming.dart';

class CardFeatures extends StatefulWidget {
  CardFeatures({
    this.imageAsset,
    this.resultText,
    //this.title,
    this.onPressed,
    this.abreviationText,
    this.context,
    this.columnWidgets,
  });

  final String resultText;
  final String imageAsset;
  //final String title;
  final Function onPressed;
  final String abreviationText;
  final BuildContext context;
  final List<Widget> columnWidgets;

  @override
  _CardFeaturesState createState() => _CardFeaturesState();
}

class _CardFeaturesState extends State<CardFeatures> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text(
              //     widget.title,
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 30,
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.asset(
                    widget.imageAsset,
                    scale: 3,
                    color: widget.imageAsset == 'images/blood.jpg'
                        ? null
                        : themeNotifier.isDarkTheme()
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AbreviationButton(
                onPressed: () {
                  alertAbreviation(
                    widget.abreviationText,
                    widget.context,
                  );
                },
              ),
            ],
          ),
          Column(
            children: widget.columnWidgets,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                color: Colors.redAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: widget.onPressed,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                widget.resultText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
