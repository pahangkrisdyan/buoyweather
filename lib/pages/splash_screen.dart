import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:buoy_weather/states/app_state.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime2() async {
      final appState = Provider.of<AppState>(context);
      appState.initState().then((_){
        Timer.periodic(Duration(seconds: 1), (Timer t) => appState.setTime());
        navigationPage();
      });
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  @override
  Widget build(BuildContext context) {
    startTime2();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo-putih.png'),
        ),
      ),
    );
  }
}
