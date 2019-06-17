import 'package:flutter/material.dart';
import 'package:buoy_weather/states/app_state.dart';
import 'package:provider/provider.dart';

class PersebaranIkan extends StatefulWidget {
  @override
  _PersebaranIkanState createState() => _PersebaranIkanState();
}

class _PersebaranIkanState extends State<PersebaranIkan> with TickerProviderStateMixin{
  TabController _tabHariController;
  ScrollController _listIkanController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabHariController = TabController(
      length: 7,
      vsync: this,
      initialIndex: 1
    );
    _tabHariController.addListener((){
      setState(() {

      });
    });
    _listIkanController = ScrollController(
      
    );
  }
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              right: 16.0,
              left: 16.0,
              top: 6.0,
              bottom: 6.0
          ),
          child: Text(
            'HARI',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        //tab hari - hari
        Container(
          color: Colors.grey.withOpacity(0.6),
          padding: EdgeInsets.symmetric(vertical: 2.0),
          child: TabBar(
            controller: _tabHariController,
            labelPadding: EdgeInsets.all(0),
            tabs: <Widget>[
              Tab(
                child: TombolHari(
                  isActive: _tabHariController.index==0,
                  namaHari: 'Senin',
                ),
              ),
              Tab(
                child: TombolHari(
                  isActive: _tabHariController.index==1,
                  namaHari: 'Selasa',
                ),
              ),
              Tab(
                child: TombolHari(
                  isActive: _tabHariController.index==2,
                  namaHari: 'Rabu',
                ),
              ),
              Tab(
                child: TombolHari(
                  isActive: _tabHariController.index==3,
                  namaHari: 'Kamis',
                ),
              ),
              Tab(
                child: TombolHari(
                  isActive: _tabHariController.index==4,
                  namaHari: 'Jumat',
                ),
              ),
              Tab(
                child: TombolHari(
                  isActive: _tabHariController.index==5,
                  namaHari: 'Sabtu',
                ),
              ),
              Tab(
                child: TombolHari(
                  isActive: _tabHariController.index==6,
                  namaHari: 'Minggu',
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              right: 16.0,
              left: 16.0,
              top: 6.0,
              bottom: 6.0
          ),
          child: Text(
            'PERSEBARAN IKAN',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          height: 220.0,
          color: Colors.grey.withOpacity(0.8),
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0
            ),
            controller: _listIkanController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              IkanCard(
                beratIkan: state.getPrediksiIkan.kerapu,
                imagePath: 'assets/images/ikan kerapu.png',
                namaIkan: 'IKAN KERAPU',
              ),
              IkanCard(
                beratIkan: state.getPrediksiIkan.kuniran,
                imagePath: 'assets/images/ikan kuniran.png',
                namaIkan: 'IKAN KUNIRAN',
              ),
              IkanCard(
                beratIkan: state.getPrediksiIkan.nangka,
                imagePath: 'assets/images/ikan biji nangka.png',
                namaIkan: 'IKAN BIJI NANGKA',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class IkanCard extends StatelessWidget {
  final String namaIkan;
  final String imagePath;
  final double beratIkan;
  IkanCard({this.namaIkan, this.beratIkan, this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.grey.withOpacity(0.8),
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8.0
        ),
        width: 120.0,
        child: Column(
          children: <Widget>[
            Text(
              namaIkan,
              style: TextStyle(
                fontSize: 10.0
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              )
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$beratIkan kg',
              style: TextStyle(
                  fontSize: 10.0
              ),
            )
          ],
        ),
      ),
    );
  }
}


class TombolHari extends StatelessWidget {
  final bool isActive;
  final String namaHari;
  TombolHari({this.namaHari, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive?Colors.black12:Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0
        ),
        child: Text(
          namaHari,
          style: TextStyle(
            fontSize: 10.0,
          ),
          softWrap: false,
        ),
      )
    );
  }
}