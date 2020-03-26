import 'package:flutter/material.dart';
import 'package:physiology/screens/kidneyphysiology.dart';
import 'package:physiology/screens/neurophysiology.dart';
import 'package:physiology/screens/respirationphysiology.dart';
import 'package:physiology/screens/toxicology.dart';
import 'package:physiology/widgets/my_homepage_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MySecondHomePageState createState() => _MySecondHomePageState();
}

class _MySecondHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Physiology Calculations',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 80),
              SlidingCardsViewHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}

class SlidingCardsViewHomePage extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsViewHomePage> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55, //<-- set height
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Neurophysiology',
            description: '5 calculations',
            assetName: 'brain.jpg',
            tag: 'neuroTag',
            offset: pageOffset,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NeurophysiologyPage(),
                ),
              );
            },
          ),
          SlidingCard(
            name: 'Circulation & Ventilation',
            description: '8 calculations',
            assetName: 'lung.jpg',
            tag: 'ventilationTag',
            offset: pageOffset - 1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RespirationPage(),
                ),
              );
            },
          ),
          SlidingCard(
            name: 'Kidneyphysiology',
            description: '4 calculations',
            assetName: 'kidney.jpg',
            tag: 'kidneyTag',
            offset: pageOffset - 2,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KidneyPage(),
                ),
              );
            },
          ),
          SlidingCard(
            name: 'Toxicology',
            description: '4 calculations',
            assetName: 'toxicology.jpg',
            tag: 'toxicologyTag',
            offset: pageOffset - 3,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ToxicologyPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}