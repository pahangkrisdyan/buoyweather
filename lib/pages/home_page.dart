import 'package:flutter/material.dart';
import 'cuaca_maritim.dart';
import 'persebaran_ikan.dart';
import 'tentang.dart';
import 'package:buoy_weather/widget/header.dart';
import 'package:provider/provider.dart';
import 'package:buoy_weather/states/app_state.dart';
import 'dart:async';

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
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/bg-berawan.png'),
                  fit: BoxFit.fitWidth,
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
                      color: Colors.grey.withOpacity(0.6),
                      height: 80,
                      child: _bottomTabBar(_tabController)
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
  
  Widget _bottomTabBar(TabController controller){
    return TabBar(
      controller: _tabController,
      labelPadding: EdgeInsets.all(0),
      tabs: [
        Tab(
          icon: Image(
            image: AssetImage('assets/images/192px-icon-cuaca-maritim.png'),
            height: 40,
          ),
          text: "Cuaca Maritim",
        ),
        Tab(
          icon: Image(
            image: AssetImage('assets/images/192px-icon-persebaran-ikan.png'),
            height: 40,
          ),
          text: "Persebaran Ikan",
        ),
        Tab(
          icon: Image(
            image: AssetImage('assets/images/192px-icon-tentang.png'),
            height: 40,
          ),
          text: "Tentang",
        ),
      ],
    );

//  Widget _bottomTabBar(TabController controller){
//    return TabBar(
//      controller: _tabController,
//      tabs: [
//        Tab(
//          icon: Icon(Icons.wb_sunny,),
//          text: "Cuaca Maritim",
//        ),
//        Tab(
//          icon: Icon(Icons.panorama_fish_eye),
//          text: "Persebaran Ikan",
//        ),
//        Tab(
//          icon: Icon(Icons.info_outline),
//          text: "Tentang",
//        ),
//      ],
//    );
    
    
  }
}