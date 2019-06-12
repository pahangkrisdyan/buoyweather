import 'package:flutter/material.dart';

class Tentang extends StatefulWidget {
  @override
  _TentangState createState() => _TentangState();
}

class _TentangState extends State<Tentang> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: Colors.grey.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'TENTANG',
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Text(
              'Buoyweather',
              style: TextStyle(
                  fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'V.1',
              style: TextStyle(
                  fontSize: 16.0
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'DESKRIPSI',
              style: TextStyle(
                  fontSize: 16.0
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Deskripsi',
              style: TextStyle(
                  fontSize: 14.0
              ),
            ),
          ],
        ),
      )
    );
  }
}
