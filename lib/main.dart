import 'package:flutter/material.dart';
import 'pages/cuaca_maritim.dart';
import 'pages/persebaran_ikan.dart';
import 'pages/tentang.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buoy Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
        home: MyHomePage(title: 'Buoy Weather'),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/bg.jpeg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              TabBarView(
                children: [
                  CuacaMaritim(),
                  PersebaranIkan(),
                  Tentang(),
                ],
              ),
            ],
          )
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home,),
              text: "Cuaca Maritim",
            ),
            Tab(
              icon: Icon(Icons.rss_feed),
              text: "Persebaran Ikan",
            ),
            Tab(
              icon: Icon(Icons.perm_identity),
              text: "Tentang",
            ),
          ],
        ),
        backgroundColor: Colors.white.withAlpha(150),
      ),
    );
  }
}
