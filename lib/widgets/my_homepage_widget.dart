import 'package:flutter/material.dart';
import 'dart:math' as math;

class SlidingCard extends StatelessWidget {
  SlidingCard({
    this.name,
    this.description,
    this.assetName,
    this.offset,
    this.onPressed,
    this.tag,
  });

  final String name;
  final String description;
  final String assetName;
  final double offset;
  final Function onPressed;
  final String tag;

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ), //<--custom shape
        child: Column(
          children: <Widget>[
            ClipRRect(
              //<--clipping image
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'images/$assetName',
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                name: name,
                description: description,
                offset: gauss,
                tag: tag,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  CardContent({
    this.name,
    this.description,
    this.offset,
    this.tag,
  });

  final String name;
  final String description;
  final double offset;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0), //<-- translate the name label,
            child: Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Transform.translate(
            offset: Offset(8 * offset, 0), //<-- translate the name label,
            child: Text(
              description,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: 8),
          Spacer(),
        ],
      ),
    );
  }
}
