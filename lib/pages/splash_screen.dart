import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buoy_weather/states/app_state.dart';
import 'package:buoy_weather/constans.dart';

//class sebagai splashscreeen (tampilan logo pada saan aplikasi dibuka sekaligus)
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _startTime(AppState appState) async {
      appState.initState().then((_){
        navigationPage();
      });
  }

  //berpindah halaman ke HomePage
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    _startTime(appState);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('assets/images/logo-putih.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: _circularProgressIndicator(),
          ),
        ],
      )
    );
  }

  //tampilan loading (bulat)
  Widget _circularProgressIndicator(){
    final state = Provider.of<AppState>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          _getLoadingText(state.getLoadStatus),
          style: TextStyle(
              color: Colors.white
          ),
        )
      ],
    );
  }

  //kalimat yang muncul saat loading sesuai loading status
  String _getLoadingText(LoadStatus loadStatus){
    switch(loadStatus){
      case LoadStatus.PREPARE: return 'Sedang meyiapkan...'; break;
      case LoadStatus.LOAD_PREDIKSI_IKAN: return 'Sedang memuat data prediksi ikan..'; break;
      case LoadStatus.LOAD_CUACA_MARITIM: return 'Sedang memuat data cuaca maritim..'; break;
      case LoadStatus.LOAD_PREDIKSI_CUACA_MARITIM: return 'Sedang memuat data prediksi cuaca maritim..'; break;
      case LoadStatus.HAMPIR_SELESAI: return 'Hampir selesai..'; break;
      case LoadStatus.DONE: return 'Selesai..'; break;
    }
    return null;
  }
}