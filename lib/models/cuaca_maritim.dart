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


  CuacaMaritim(
    { this.entryId,
      this.arahAngin,
      this.curahHujan,
      this.humi,
      this.kecepatanAngin,
      this.ketinggian,
      this.spl,
      this.tekanan,
      this.temperatur
    });

  CuacaMaritim.fromJson(Map<String, dynamic> json)
      : entryId = json['feeds'][0]['entry_id'],
        spl = double.parse(json['feeds'][0]['field1']),
        tekanan = double.parse(json['feeds'][0]['field2']),
        ketinggian = double.parse(json['feeds'][0]['field3']),
        kecepatanAngin = double.parse(json['feeds'][0]['field4']),
        arahAngin = double.parse(json['feeds'][0]['field5']),
        curahHujan = double.parse(json['feeds'][0]['field6']),
        humi = double.parse(json['feeds'][0]['field7']),
        temperatur = double.parse(json['feeds'][0]['field8']);


}

