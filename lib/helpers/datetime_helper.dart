import 'package:flutter/material.dart';

class DateTimeHelper{

  static String getMonthName(int monthNumber){
    String monthName;
    switch(monthNumber){
      case 1:
        monthName = "STYCZEŃ";
        break;
      case 2:
        monthName = "LUTY";
        break;
      case 3:
        monthName = "MARZEC";
        break;
      case 4:
        monthName = "KWIECIEŃ";
        break;
      case 5:
        monthName = "MAJ";
        break;
      case 6:
        monthName = "CZERWIEC";
        break;
      case 7:
        monthName = "LIPIEC";
        break;
      case 8:
        monthName = "SIERPIEŃ";
        break;
      case 9:
        monthName = "WRZESIEŃ";
        break;
      case 10:
        monthName = "PAŹDZIERNIK";
        break;
      case 11:
        monthName = "LISTOPAD";
        break;
      case 12:
        monthName = "GRUDZIEŃ";
        break;
    }
    return monthName;
  }

  static double getTimeInDouble(TimeOfDay timeOfDay){
    return timeOfDay.hour + (timeOfDay.minute / 60.0);
  }

  static TimeOfDay getDoubleInTime(double timeInDouble){
    int hour = timeInDouble.truncate();
    double fractional = timeInDouble - hour;
    int minutes = (fractional * 60.00).round();
    return TimeOfDay(hour: hour, minute: minutes);
  }

}