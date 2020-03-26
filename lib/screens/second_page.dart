import 'package:flutter/material.dart';
import 'package:physiology/widgets/my_homepage_widget.dart';
import 'transport_solutes_page.dart';

class MySecondHomePage extends StatefulWidget {
  @override
  _MySecondHomePageState createState() => _MySecondHomePageState();
}

class _MySecondHomePageState extends State<MySecondHomePage> {
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
                  'Abiotic Calculations',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 80),
              SlidingCardsViewSecondPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class SlidingCardsViewSecondPage extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsViewSecondPage> {
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
      height: MediaQuery.of(context).size.height * 0.5, //<-- set height
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Transport of Solutes and Water',
            description: '3 calculations',
            assetName: 'solutes.jpg',
            tag: 'transportTag',
            offset: pageOffset,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SolutesPage()));
            },
          ),
        ],
      ),
    );
  }
}
