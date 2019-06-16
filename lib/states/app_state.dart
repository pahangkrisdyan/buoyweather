import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:buoy_weather/models/cuaca_maritim.dart';
import 'dart:convert';

class AppState with ChangeNotifier {

  static const String API_KEY = 'UY4GS7XUXXOYE3R0';
  static const String api_all_fields_url = 'www.thingspeak.com';

  static var queryParameters = {
    'api_key': API_KEY,
    'results': '1',
  };

  var apiUri = Uri.https(api_all_fields_url, '/channels/790450/feeds.json', queryParameters);

  DateTime _dateTime;
  String _time;
  String _date;
  String _dayName;

  CuacaMaritim _cuacaMaritim;

  AppState();

  String get getTime => _time;
  String get getDate => _date;
  String get getDayName => _dayName;
  CuacaMaritim get getCuacamaritim => _cuacaMaritim;

  Future<void> fetch()async{
    var response = await http.get(apiUri);
    setCuacaMaritim(response.body);
  }

  void setCuacaMaritim(String jsonString){
    Map cuacaMaritimMap = jsonDecode(jsonString);
    _cuacaMaritim = CuacaMaritim.fromJson(cuacaMaritimMap);
  }

  Future<void> initState() async {
    await fetch();
    _dateTime = DateTime.now().add(Duration(hours: 7));//waktu jakarta
    if(DateFormat('kk:mm').format(_dateTime)!=_time||_date==null||_dayName==null){
      String day = DateFormat('dd').format(_dateTime);
      String month = _convertToDayMonthName(DateFormat('MM').format(_dateTime));
      String year = DateFormat('yyyy').format(_dateTime);
      _time = DateFormat('kk:mm').format(_dateTime);
      _dayName = _convertToIndonesian(DateFormat('EEEE').format(_dateTime));
      _date = day + ' ' + month + ' ' + year;
    }
  }

  void setTime(){
    fetch();
    _dateTime = DateTime.now().add(Duration(hours: 7));//waktu jakarta
    if(DateFormat('kk:mm').format(_dateTime)!=_time||_date==null||_dayName==null){
      String day = DateFormat('dd').format(_dateTime);
      String month = _convertToDayMonthName(DateFormat('MM').format(_dateTime));
      String year = DateFormat('yyyy').format(_dateTime);
      _time = DateFormat('kk:mm').format(_dateTime);
      _dayName = _convertToIndonesian(DateFormat('EEEE').format(_dateTime));
      _date = day + ' ' + month + ' ' + year;
    }
    notifyListeners();
  }

  String _convertToDayMonthName(String monthInt){
    switch(monthInt){
      case '01': return 'Januari'; break;
      case '02': return 'Februari'; break;
      case '03': return 'Maret'; break;
      case '04': return 'April'; break;
      case '05': return 'Mei'; break;
      case '06': return 'Juni'; break;
      case '07': return 'Juli'; break;
      case '08': return 'Agustus'; break;
      case '09': return 'September'; break;
      case '10': return 'Oktober'; break;
      case '11': return 'November'; break;
      case '12': return 'Desember'; break;
    }
    return '----';
  }

  String _convertToIndonesian(String day){
    switch(day){
      case 'Sunday': return 'Minggu'; break;
      case 'Monday': return 'Senin'; break;
      case 'Tuesday': return 'Selasa'; break;
      case 'Wednesday': return 'Rabu'; break;
      case 'Thursday': return 'Kamis'; break;
      case 'Friday': return 'Jumat'; break;
      case 'Saturday': return 'Sabtu'; break;
    }
    return '----';
  }
}