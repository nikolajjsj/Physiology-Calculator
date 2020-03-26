import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class MyExpandableWidget extends StatefulWidget {
  MyExpandableWidget({
    this.title,
    this.expanded,
  });

  final String title;
  final Widget expanded;

  @override
  _MyExpandableWidgetState createState() => _MyExpandableWidgetState();
}

class _MyExpandableWidgetState extends State<MyExpandableWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          expanded: widget.expanded,
          tapHeaderToExpand: true,
          hasIcon: true,
        ),
      ),
    );
  }
}
