import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static Color appbarcolor = Color.fromARGB(255, 128, 16, 16);
  static Color backgroundcolor = Colors.red;
  static TextStyle textfancyheader =
      GoogleFonts.flavors(fontSize: 40, color: Colors.orange[300]);
  static TextStyle textfancyheader2 =
      GoogleFonts.flavors(fontSize: 30, color: Colors.orange[300]);
  static TextStyle texterror = TextStyle(
      color: Colors.red[300], fontSize: 16, fontStyle: FontStyle.italic);
  static TextStyle textlink = TextStyle(
      color: Colors.pink[300],
      fontSize: 16,
      decoration: TextDecoration.underline);
  static TextStyle textbody =
      TextStyle(color: Colors.blueAccent[300], fontSize: 16);
  static TextStyle textbodywhite = TextStyle(color: Colors.white, fontSize: 16);
  static TextStyle textbodywhitebold =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
  static TextStyle textbodyfocus =
      TextStyle(color: Colors.blueAccent, fontSize: 20);
  static TextStyle textbodyfocuswhite =
      TextStyle(color: Colors.white, fontSize: 20);
  static bool isDate(String str) {
    try {
      var inputFormat = DateFormat('dd/mm/yyyy');
      var date1 = inputFormat.parseStrict(str);
      return true;
    } catch (e) {
      print('---loi---');
      return false;
    }
  }
}
