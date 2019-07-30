import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buoy_weather/constans.dart';
import 'package:buoy_weather/states/app_state.dart';

//Kode sebagai widget/yampilan yang terlihat pada apliaksi

//class sebagai tampilan halaman cuaca maritim
class CuacaMaritim extends StatelessWidget {
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

//class sebagai panel data (tabel)
class PanelDataCuacaMaritim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          //judul sebelah kiri
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
                SizedBox(
                  height: 0.0,
                ),
                Text(
                  'CUACA',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 0.0,
                ),
                Text(
                  'CURAH HUJAN',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 0.0,
                ),
                Text(
                  'GELOMBANG AIR LAUT',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 0.0,
                ),
                Text(
                  'ARUS LAUT',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 0.0,
                ),
                Text(
                  'KECEPATAN ANGIN',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 0.0,
                ),
                Text(
                  'ARAH ANGIN',
                  style: TextStyle(
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: CuacaMaritimTable(),
          )
        ],
      ),
    );
  }
}

//class sebagai table data
class CuacaMaritimTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: state.getListCuacaMaritim.listCuacaMaritim.map((cuacaMaritim){
        return CuacaMaritimColumn(
          label: cuacaMaritim.label,
          kecepatanAngin: cuacaMaritim.kecepatanAngin,
          gelombangAirLaut: cuacaMaritim.ketinggian,
          curahHujan: cuacaMaritim.curahHujan,
          cuaca: Cuaca.Cerah,
          arusLaut: cuacaMaritim.tekanan,
          arahAngin: ArahAngin.Utara,
        );
      }).toList(),
    );
  }
}


// tampilan dalam 1 kolom (1 record cuaca)
class CuacaMaritimColumn extends StatelessWidget {

  final Cuaca cuaca;
  final double curahHujan;
  final double gelombangAirLaut;
  final double arusLaut;
  final double kecepatanAngin;
  final ArahAngin arahAngin;
  final String label;

  CuacaMaritimColumn({
    this.cuaca,
    this.arahAngin,
    this.kecepatanAngin,
    this.curahHujan,
    this.arusLaut,
    this.gelombangAirLaut,
    this.label
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
//            color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //pukul
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          Container(
            height: 30.0,
            child: Image(
              image: AssetImage(cuacaToImagePath(cuaca)),
            ),
          ),
          Text(
            //curah hujan
//            state.getCuacamaritim?.ketinggian.toString() + 'mm',
            curahHujan.toString() + 'mm',
            style: TextStyle(
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Text(
            //gelombang air laut
            //state.getCuacamaritim?.spl.toString() + 'm',
            gelombangAirLaut.toStringAsFixed(3) + 'cm',
            style: TextStyle(
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Text(
            //arus laut
//            state.getCuacamaritim?.tekanan.toString() + 'm',
            arusLaut==null?'--':arusLaut.toStringAsFixed(3) + 'cm/s',
            style: TextStyle(
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Text(
            //kecepatan angin
//            state.getCuacamaritim?.kecepatanAngin.toString() + 'm/s',
            kecepatanAngin.toStringAsFixed(3) + 'm/s',
            style: TextStyle(
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Text(
            //arah angin
            //state.getCuacamaritim?.arahAngin.toString(),
            arahAnginToString(arahAngin),
            style: TextStyle(
            ),
          ),SizedBox(
            height: 6.0,
          ),
        ],
      ),
    );
  }
}


