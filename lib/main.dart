import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'states/app_state.dart';
import 'pages/splash_screen.dart';
import 'pages/home_page.dart';

void main() => runApp(
    ChangeNotifierProvider<AppState>(
      builder: (_) => AppState(),
      child: MyApp(),
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => MyHomePage(
            title: 'Buoy Weather'
        )
      },
      title: 'Buoy Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'SourceSansPro',
      ),
      home: SplashScreen(),
    );
  }
}