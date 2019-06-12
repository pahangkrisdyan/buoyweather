import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppState with ChangeNotifier {

  DateTime _dateTime;
  String _time;
  String _date;
  String _dayName;

  AppState();

  String get getTime => _time;
  String get getDate => _date;
  String get getDayName => _dayName;

  void setTime(){
    _dateTime = DateTime.now();
    String day = DateFormat('dd').format(_dateTime);
    String month = _convertToDayMonthName(DateFormat('MM').format(_dateTime));
    String year = DateFormat('yyyy').format(_dateTime);
    _time = DateFormat('kk:mm').format(_dateTime);
    _dayName = _convertToIndonesian(DateFormat('EEEE').format(_dateTime));
    _date = day + ' ' + month + ' ' + year;
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