import 'package:flutter/material.dart';

class CuacaMaritim{

  final int entryId;
  final double spl;
  final double tekanan;
  final double ketinggian;
  final double kecepatanAngin;
  final double arahAngin;
  final double curahHujan;
  final double humi;
  final double temperatur;
  final String label;

  CuacaMaritim(
    { this.entryId,
      this.arahAngin,
      this.curahHujan,
      this.humi,
      this.kecepatanAngin,
      this.ketinggian,
      this.spl,
      this.tekanan,
      this.temperatur,
      this.label
    });

  CuacaMaritim.fromJson(Map<String, dynamic> json)
      : entryId = json['feeds'][0]['entry_id'],
        spl = double.parse(json['feeds'][0]['field1']),
//        tekanan = double.parse(json['feeds'][0]['field2']),
        tekanan = null,
        ketinggian = double.parse(json['feeds'][0]['field3']),
        kecepatanAngin = double.parse(json['feeds'][0]['field4']),
        arahAngin = double.parse(json['feeds'][0]['field5']),
        curahHujan = double.parse(json['feeds'][0]['field6']),
        humi = double.parse(json['feeds'][0]['field7']),
        temperatur = double.parse(json['feeds'][0]['field8']),
        label = 'SAAT INI';


}

class CuacaMaritimList {
  final List<CuacaMaritim> listCuacaMaritim;

  static List<CuacaMaritim> _fromJson(Map<String, dynamic> json){
    List<CuacaMaritim> list = List<CuacaMaritim>();
    for(int i = 0; i<20; i++){
      Map<String, dynamic> item = json['feeds'][i];
      list.add(CuacaMaritim(
        arahAngin: double.parse(item['field5']),
        curahHujan: double.parse(item['field3']),
        entryId: 0,
        humi: 0.0,
        kecepatanAngin: double.parse(item['field4']),
        spl: 0.0,
//        label: item['created_at'].toString().substring(0,10)+ '\n' + item['created_at'].toString().substring(11,16),
        label: item['created_at'].toString().substring(11,16),
        ketinggian: double.parse(item['field1']),
        tekanan: double.parse(item['field2']),
        temperatur: 0.0,
      ));
    }
    return list;
  }

  CuacaMaritimList.fromJson(Map<String, dynamic> json)
    : listCuacaMaritim = _fromJson(json);

}

