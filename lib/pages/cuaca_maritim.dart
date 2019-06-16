import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buoy_weather/states/app_state.dart';
class CuacaMaritim extends StatefulWidget {
  @override
  _CuacaMaritimState createState() => _CuacaMaritimState();
}

class _CuacaMaritimState extends State<CuacaMaritim> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 6.0
            ),
            child: Text(
              "HARI INI",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.withOpacity(0.6),
              child: PanelDataCuacaMaritim(),
            ),
          )
          //table
        ],
      ),
    );
  }
}

class PanelDataCuacaMaritim extends StatefulWidget {
  @override
  _PanelDataCuacaMaritimState createState() => _PanelDataCuacaMaritimState();
}

class _PanelDataCuacaMaritimState extends State<PanelDataCuacaMaritim> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 16.0
      ),
      child: Row(
        children: <Widget>[
          //left header
          Container(
            width: 100.0,
//            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //pukul
                Text(
                  'PUKUL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'CUACA',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'CURAH HUJAN',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'GELOMBANG AIR LAUT',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ARUS LAUT',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'KECEPATAN ANGIN',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ARAH ANGIN',
                  style: TextStyle(
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Container(
            width: 100.0,
//            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //pukul
                Text(
                  'Saat Ini',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  //cuaca
                  state.getCuacamaritim?.curahHujan.toString() + 'mm',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //curah hujan
                  state.getCuacamaritim?.curahHujan.toString() + 'mm',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //gelombang air laut
                  state.getCuacamaritim?.ketinggian.toString() + 'm',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //arus laut
                  state.getCuacamaritim?.tekanan.toString() + 'm',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //kecepatan angin
                  state.getCuacamaritim?.kecepatanAngin.toString() + 'm/s',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //arah angin
                  state.getCuacamaritim?.arahAngin.toString(),
                  style: TextStyle(
                  ),
                ),
              ],
            ),
          ),
//          Expanded(
//            child: SingleChildScrollView(
//              scrollDirection: Axis.horizontal,
//              child: Container(
//                //table data
//              ),
//            ),
//          )
        ],
      ),
    );
  }
}

