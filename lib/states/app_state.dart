import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:buoy_weather/models/cuaca_maritim.dart';
import 'package:buoy_weather/models/prediksi_ikan.dart';
import 'dart:convert';

class AppState with ChangeNotifier {

  static const String API_KEY = 'UY4GS7XUXXOYE3R0';
  static const String api_all_fields_url = 'www.thingspeak.com';

  static var queryParameters = {
    'api_key': API_KEY,
    'results': '1',
  };

  var apiUri = Uri.https(api_all_fields_url, '/channels/790450/feeds.json', {'api_key': API_KEY,'results': '1'});
  var cuacaMaritimFuturePredictionUri = Uri.https(api_all_fields_url, '/channels/802231/feeds.json', {'api_key': API_KEY,'results': '20'});
  var prediksiIkanUri = Uri.https(api_all_fields_url, '/channels/802240/feeds.json', {'api_key': API_KEY,'results': '1'});

  DateTime _dateTime;
  String _time;
  String _date;
  String _dayName;

  CuacaMaritim _cuacaMaritim;

  CuacaMaritimList _listCuacaMaritim;

  PrediksiIkan _prediksiIkan;

  AppState();

  String get getTime => _time;
  String get getDate => _date;
  String get getDayName => _dayName;
  CuacaMaritim get getCuacamaritim => _cuacaMaritim;
  CuacaMaritimList get getListCuacaMaritim=> _listCuacaMaritim;
  PrediksiIkan get getPrediksiIkan => _prediksiIkan;


  Future<void> fetch()async{
    var response = await http.get(apiUri);
    setCuacaMaritim(response.body);
    var response2 = await http.get(cuacaMaritimFuturePredictionUri);
    setCuacaMaritimList(response2.body);
    var response3 = await http.get(prediksiIkanUri);
    setPrediksiIkan(response3.body);
  }

  void setPrediksiIkan(String jsonString){
    Map map = jsonDecode(jsonString);
    _prediksiIkan = PrediksiIkan.fromJson(map);
  }

  void setCuacaMaritimList(String jsonString){
    Map map = jsonDecode(jsonString);
    _listCuacaMaritim = CuacaMaritimList.fromJson(map);
    _listCuacaMaritim.listCuacaMaritim.insert(0, _cuacaMaritim);
  }

  void setCuacaMaritim(String jsonString){
    Map cuacaMaritimMap = jsonDecode(jsonString);
    _cuacaMaritim = CuacaMaritim.fromJson(cuacaMaritimMap);
  }

  Future<void> initState() async {
    await fetch();
    _dateTime = DateTime.now();//waktu jakarta
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