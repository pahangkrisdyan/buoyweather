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
        spl = json['feeds'][0]['field1']!=null?double.parse(json['feeds'][0]['field1']):0.0,
//        tekanan = double.parse(json['feeds'][0]['field2']),
        tekanan = null,
        ketinggian = json['feeds'][0]['field3']!=null?double.parse(json['feeds'][0]['field3']):0.0,
        kecepatanAngin = json['feeds'][0]['field4']!=null?double.parse(json['feeds'][0]['field4']):0.0,
        arahAngin = json['feeds'][0]['field5']!=null?double.parse(json['feeds'][0]['field5']):0.0,
        curahHujan = json['feeds'][0]['field6']!=null?double.parse(json['feeds'][0]['field6']):0.0,
        humi = json['feeds'][0]['field7']!=null?double.parse(json['feeds'][0]['field7']):0.0,
        temperatur = json['feeds'][0]['field8']!=null?double.parse(json['feeds'][0]['field8']):0.0,
        label = 'SAAT INI';


}

class CuacaMaritimList {
  final List<CuacaMaritim> listCuacaMaritim;

  static List<CuacaMaritim> _fromJson(Map<String, dynamic> json){
    List<CuacaMaritim> list = List<CuacaMaritim>();
    for(int i = 0; i<12; i++){
      Map<String, dynamic> item = json['feeds'][i];
      list.add(CuacaMaritim(
        arahAngin: item['field5']!=null?double.parse(item['field5']):0.0,
        curahHujan: item['field3']!=null?double.parse(item['field3']):0.0,
        entryId: 0,
        humi: 0.0,
        kecepatanAngin: item['field4']!=null?double.parse(item['field4']):0.0,
        spl: 0.0,
//        label: item['created_at'].toString().substring(0,10)+ '\n' + item['created_at'].toString().substring(11,16),
        label: item['created_at'].toString().substring(11,16),
        ketinggian: item['field1']!=null?double.parse(item['field1']):0.0,
        tekanan: item['field2']!=null?double.parse(item['field2']):0.0,
        temperatur: 0.0,
      ));
    }
    return list;
  }

  CuacaMaritimList.fromJson(Map<String, dynamic> json)
    : listCuacaMaritim = _fromJson(json);

}