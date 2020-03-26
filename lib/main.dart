import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:physiology/screens/homepage.dart';
import 'package:physiology/screens/settings.dart';
import 'theming.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:physiology/screens/second_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? true;
    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (BuildContext context) =>
            ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
        child: MyApp(),
      ),
    );
  });
}

//method for making alert dialogs for abreviations
alertAbreviation(String vText, x) {
  return showDialog(
    context: x,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Abreviations'),
        content: Text(vText),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
    },
  );
}

//method for making textFields in a row
Widget textEditField(
    {TextEditingController control, String labelTekst, String suffixTekst}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(6.0),
      child: TextField(
        textAlign: TextAlign.center,
        controller: control,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          suffixText: suffixTekst,
          labelText: labelTekst,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    ),
  );
}

//class for myApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).getTheme(),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController controller = PageController();

  List<GButton> tabs = List();

  @override
  void initState() {
    super.initState();

    var padding = EdgeInsets.symmetric(horizontal: 12, vertical: 5);
    double gap = 30;

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.red,
      iconColor: Colors.red,
      textColor: Colors.red,
      color: Colors.red.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: Icons.home,
      text: 'Calculations',
    ));
    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.purple,
      iconColor: Colors.purple,
      textColor: Colors.purple,
      color: Colors.purple.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: Icons.scatter_plot,
      text: 'Tools',
    ));
    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.pink,
      iconColor: Colors.pink,
      textColor: Colors.pink,
      color: Colors.pink.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: Icons.settings,
      text: 'Settings',
    ));
  }

  final List<Widget> _children = [
    MyHomePage(),
    MySecondHomePage(),
    SettingsPage(),
  ];

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (page) {
          setState(() {
            _page = page;
          });
        },
        controller: controller,
        itemBuilder: (context, position) {
          return _children[position];
        },
        itemCount: tabs.length,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: themeNotifier.isDarkTheme() ? Colors.black87 : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
          child: GNav(
              tabs: tabs,
              selectedIndex: _page,
              onTabChange: (index) {
                setState(() {
                  _page = index;
                });
                controller.jumpToPage(index);
              }),
        ),
      ),
    );
  }
}
