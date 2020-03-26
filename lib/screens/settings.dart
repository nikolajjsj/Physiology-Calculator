import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:physiology/theming.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:day_night_switch/day_night_switch.dart';

//settings page
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  launchURL() async {
    const url = 'mailto:nikolaj.app.dev@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }

  launchWeb(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch';
    }
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:
                    themeNotifier.isDarkTheme() ? Colors.white : Colors.black),
          ),
          centerTitle: true,
        ),
        body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: themeNotifier.isDarkTheme() ? Colors.black38 : Colors.white,
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              ListTile(
                title: Text(
                    themeNotifier.isDarkTheme() ? 'Dark Theme' : 'Light Theme'),
                subtitle: Text('Click to change theme'),
                trailing: Transform.scale(
                  scale: 0.32,
                  child: DayNightSwitch(
                    value: themeNotifier.isDarkTheme(),
                    onChanged: (newValue) {
                      setState(() {});
                      onThemeChanged(newValue, themeNotifier);
                    },
                  ),
                ),
              ),
              author(themeNotifier),
              Divider(),
              ListTile(
                title: Text('Contributors:'),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://pure.au.dk/portal/files/52378595/web_Johannes_Overgaard_JR_9178_1_.jpg',
                  ),
                ),
                onTap: () {
                  launchWeb(
                    'http://pure.au.dk/portal/da/johannes.overgaard@biology.au.dk',
                  );
                },
                title: Text('Johannes Overgaard, Ph. D.'),
                subtitle: Text('Valuable advice'),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://pure.au.dk/portal/files/88869486/picture_Angela.jpg',
                  ),
                ),
                onTap: () {
                  launchWeb(
                    'http://pure.au.dk/portal/da/angela.fago@biology.au.dk',
                  );
                },
                title: Text('Angela Fago, Ph. D.'),
                subtitle: Text('Valuable advice'),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://pure.au.dk/portal/files/168875661/Hans_Malte_picture_3.jpg',
                  ),
                ),
                onTap: () {
                  launchWeb(
                    'https://pure.au.dk/portal/da/persons/hans-malte(d18fc340-77ef-4d8b-9101-6ac18ac2f032).html',
                  );
                },
                title: Text('Hans Malte, Ph. D.'),
                subtitle: Text('Valuable advice'),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://image.flaticon.com/teams/slug/surang.jpg',
                  ),
                ),
                title: Text("Icons made by Surang"),
                subtitle:
                    Text("www.flaticon.com/authors/surang\nwww.flaticon.com"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget author(ThemeNotifier themeNotifier) {
    /// launch url
    _launchURL() async {
      const url = 'https://twitter.com/nikolaj_jsj';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text('Developer'),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.solidUserCircle),
          title: Text('Nikolaj Jensen'),
          subtitle: Text('Aarhus, Denmark'),
        ),
        ListTile(
          title: Text('Send feedback'),
          subtitle: Text('via email'),
          onTap: () => launchURL(),
          leading: Icon(
            Icons.email,
            color: themeNotifier.isDarkTheme()
                ? Colors.white
                : Colors.blueGrey[900],
          ),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.twitter, color: Colors.blue),
          title: Text('Find me on Social Media'),
          onTap: () => _launchURL(),
        ),
        ListTile(
          leading: Icon(Icons.share, color: Colors.red),
          title: Text('Share App to Friends'),
          onTap: () => Share.share(
            'https://play.google.com/store/apps/details?id=com.nikolajjsj.physiology',
          ),
        ),
        ListTile(
          leading: Icon(Icons.star, color: Colors.amber),
          title: Text('Review App'),
          onTap: () => AppReview.requestReview,
        ),
      ],
    );
  }
}
