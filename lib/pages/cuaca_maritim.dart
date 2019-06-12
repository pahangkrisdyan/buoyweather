import 'package:flutter/material.dart';
import 'package:buoy_weather/widget/header.dart';

class CuacaMaritim extends StatefulWidget {
  @override
  _CuacaMaritimState createState() => _CuacaMaritimState();
}

class _CuacaMaritimState extends State<CuacaMaritim> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //header
          Header(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0
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
              color: Colors.grey.withOpacity(0.9),
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 16.0
      ),
      child: Row(
        children: <Widget>[
          //left header
          Container(
            width: 100.0,
            color: Colors.white,
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
                Text(
                  'CURAH HUJAN',
                  style: TextStyle(
                  ),
                ),
                Text(
                  'GELOMBANG AIR LAUT',
                  style: TextStyle(
                  ),
                ),
                Text(
                  'ARUS LAUT',
                  style: TextStyle(
                  ),
                ),
                Text(
                  'KECEPATAN ANGIN',
                  style: TextStyle(
                  ),
                ),
                Text(
                  'ARAH ANGIN',
                  style: TextStyle(
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

