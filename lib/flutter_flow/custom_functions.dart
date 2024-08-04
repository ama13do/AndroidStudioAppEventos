import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

List<String> getHourList() {
  List<String> hourList = [];
  for (int hour = 0; hour < 24; hour++) {
    String formattedHour = hour.toString().padLeft(2, '0');
    String amPm = hour < 12 ? 'AM' : 'PM';
    int displayHour = hour == 0
        ? 12
        : hour <= 12
            ? hour
            : hour - 12;
    String hourString = '$displayHour:00 $amPm';
    hourList.add(hourString);
  }
  return hourList;
}

List<String> getHoursAfter(
  String selectedStart,
  List<String> allHours,
) {
  if (selectedStart == null || allHours == null) {
    return ["null"];
  }

  int inputIndex = allHours.indexOf(selectedStart);

  if (inputIndex == -1 || inputIndex == allHours.length - 1) {
    return allHours;
  }

  return allHours.sublist(inputIndex + 1);
}

List<String> getTimeZones() {
  return [
    'UTC+14:00 - (Kiritimati)',
    'UTC+13:45 - (Chatham Islands)',
    'UTC+13:00 - (Samoa, Tonga)',
    'UTC+12:45 - (Chatham Islands)',
    'UTC+12:00 - (Fiji, New Zealand)',
    'UTC+11:00 - (Solomon Islands, Vanuatu)',
    'UTC+10:30 - (Lord Howe Island)',
    'UTC+10:00 - (Australia, Guam)',
    'UTC+09:30 - (Australia Central)',
    'UTC+09:00 - (Japan, Korea)',
    'UTC+08:45 - (Eucla)',
    'UTC+08:00 - (China, Singapore)',
    'UTC+07:00 - (Thailand, Vietnam)',
    'UTC+06:30 - (Myanmar, Cocos Islands)',
    'UTC+06:00 - (Bangladesh, Bhutan)',
    'UTC+05:45 - (Nepal)',
    'UTC+05:30 - (India, Sri Lanka)',
    'UTC+05:00 - (Pakistan, Uzbekistan)',
    'UTC+04:30 - (Afghanistan)',
    'UTC+04:00 - (Armenia, United Arab Emirates)',
    'UTC+03:30 - (Iran)',
    'UTC+03:00 - (Iraq, Kenya, Russia)',
    'UTC+02:00 - (Egypt, Israel, South Africa)',
    'UTC+01:00 - (Nigeria, Norway)',
    'UTC+00:00 - (Ghana, Iceland)',
    'UTC-01:00 - (Cape Verde)',
    'UTC-02:00 - (South Georgia)',
    'UTC-02:30 - (Newfoundland)',
    'UTC-03:00 - (Argentina, Brazil)',
    'UTC-03:30 - (Newfoundland)',
    'UTC-04:00 - (Chile, Canada)',
    'UTC-04:30 - (Venezuela)',
    'UTC-05:00 - (Colombia, Peru, USA)',
    'UTC-06:00 - (Costa Rica, Mexico)',
    'UTC-07:00 - (USA)',
    'UTC-08:00 - (USA, Canada)',
    'UTC-09:00 - (Alaska)',
    'UTC-09:30 - (Marquesas Islands)',
    'UTC-10:00 - (Hawaii)',
    'UTC-11:00 - (American Samoa)',
    'UTC-12:00 - (Baker Island)',
  ];
}
