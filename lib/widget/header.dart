import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      color: Colors.grey.withOpacity(0.9),
      height: 120.0,
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
                    '29',
                    style: TextStyle(
                      fontSize: 54.0,
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
                '18.45',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Senin',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0
                ),
              ),
              Text(
                '25 Maret 2019',
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
