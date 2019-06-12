import 'package:flutter/material.dart';
import 'pages/cuaca_maritim.dart';
import 'pages/persebaran_ikan.dart';
import 'pages/tentang.dart';
import 'widget/header.dart';
import 'package:provider/provider.dart';
import 'states/AppState.dart';
import 'dart:async';

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
        home: ChangeNotifierProvider<AppState>(
          builder: (_)=>AppState(),
            child: MyHomePage(title: 'Buoy Weather')
        ),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0
    );
    _tabController.addListener((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    Timer.periodic(Duration(seconds: 1), (Timer t) => appState.setTime());
    return Scaffold(
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
            Container(
              child: Column(
                children: <Widget>[
                  _tabController.index!=2?Header()
                  :Container(),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        CuacaMaritim(),
                        PersebaranIkan(),
                        Tentang(),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.withOpacity(0.8),
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.wb_sunny,),
                          text: "Cuaca Maritim",
                        ),
                        Tab(
                          icon: Icon(Icons.panorama_fish_eye),
                          text: "Persebaran Ikan",
                        ),
                        Tab(
                          icon: Icon(Icons.info_outline),
                          text: "Tentang",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
      backgroundColor: Colors.white.withAlpha(150),
    );
  }
}