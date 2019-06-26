import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buoy_weather/states/app_state.dart';

//class sebagai tampilan header (jam, suhu, tgl dll)
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      color: Colors.grey.withOpacity(0.6),
      height: 118.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // left side header
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //surabya
              Text(
                'Surabaya',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Jawa Timur',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    state.getCuacamaritim?.temperatur.toString(),
                    style: TextStyle(
                      fontSize: 46.0,
                    ),
                  ),
                  Text(
                    'O',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black
                    ),
                  ),
                ],
              )
            ],
          ),
          //right sire header
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              Text(
                state.getTime.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                state.getDayName.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0
                ),
              ),
              Text(
                state.getDate.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Berawan 32\" / 24\"',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

