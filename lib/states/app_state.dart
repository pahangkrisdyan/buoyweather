import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:buoy_weather/models/cuaca_maritim.dart';
import 'package:buoy_weather/models/prediksi_ikan.dart';
import 'dart:convert';
import 'dart:async';

enum LoadStatus{
  PREPARE, LOAD_CUACA_MARITIM, LOAD_PREDIKSI_CUACA_MARITIM, LOAD_PREDIKSI_IKAN, HAMPIR_SELESAI, DONE
}

class AppState with ChangeNotifier {

  static const String API_KEY = 'UY4GS7XUXXOYE3R0';
  static const String DOMAIN_URL = 'www.thingspeak.com';


  var apiUri = Uri.https(DOMAIN_URL, '/channels/790450/feeds.json', {'api_key': API_KEY,'results': '1'});
  var cuacaMaritimFuturePredictionUri = Uri.https(DOMAIN_URL, '/channels/802231/feeds.json', {'api_key': API_KEY,'results': '12'});
  var prediksiIkanUri = Uri.https(DOMAIN_URL, '/channels/802240/feeds.json', {'api_key': API_KEY,'results': '1'});


  DateTime _dateTime;
  String _time;
  String _date;
  String _dayName;

  LoadStatus _loadStatus;

  CuacaMaritim _cuacaMaritim;

  CuacaMaritimList _listCuacaMaritim;

  PrediksiIkan _prediksiIkan;

  AppState();

  String get getTime => _time;
  String get getDate => _date;
  String get getDayName => _dayName;
  CuacaMaritim get getCuacamaritim => _cuacaMaritim;
  CuacaMaritimList get getListCuacaMaritim => _listCuacaMaritim;
  PrediksiIkan get getPrediksiIkan => _prediksiIkan;
  LoadStatus get getLoadStatus => _loadStatus;
  int i = 0;
  Future<void> _fetchData()async{
    setLoadStatus(LoadStatus.LOAD_CUACA_MARITIM);
    var response = await http.get(apiUri);
    setCuacaMaritim(response.body);
    setLoadStatus(LoadStatus.LOAD_PREDIKSI_IKAN);
    var response3 = await http.get(prediksiIkanUri);
    setPrediksiIkan(response3.body);
    setLoadStatus(LoadStatus.LOAD_PREDIKSI_CUACA_MARITIM);
    var response2 = await http.get(cuacaMaritimFuturePredictionUri);
    setCuacaMaritimList(response2.body);
  }

  void setPrediksiIkan(String jsonString){
    Map map = jsonDecode(jsonString);
    _prediksiIkan = PrediksiIkan.fromJson(map);
  }

  void setLoadStatus(LoadStatus loadStatus){
    _loadStatus = loadStatus;
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
    await _refreshData();
    Timer.periodic(Duration(seconds: 1), (_) => setTime());
  }



  void _refreshData() async {
    setLoadStatus(LoadStatus.PREPARE);
    await _fetchData();
    setLoadStatus(LoadStatus.HAMPIR_SELESAI);
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

  void setTime()async{
    await _refreshData();
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