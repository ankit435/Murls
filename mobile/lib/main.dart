import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murls/screens/home.dart';
import 'package:murls/screens/profile.dart';

import 'package:murls/widgets/graph.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:murls/screens/add_new_urls.dart';

import 'package:murls/screens/url_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/murls_items.dart';

import './screens/listed_url_screen.dart';
import './screens/add_new_urls.dart';
import './screens/onboarding_screen.dart';
import 'helpers/theme.dart';

int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: murls_detail(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        title: 'Murls',
        theme: getTheme(),
        home: isviewed != 0 ? OnboardingScreen() : HomeScreen(),
        routes: {
          listed_url.routeName: (ctx) => listed_url(),
          addUrls.routeName: (ctx) => addUrls(),
          url_detail.routeName: (ctx) => url_detail(),
          BarChartSample1.routeName: (ctx) => BarChartSample1(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
