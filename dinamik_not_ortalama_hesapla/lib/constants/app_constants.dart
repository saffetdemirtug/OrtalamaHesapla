import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //Google Fonts paketi yüklendi.
//import 'package:flutter_brand_palettes/flutter_brand_palettes.dart';
//Instagram palette


class Sabitler {
  static const anaRenk = Colors.deepPurple;
  //static final googleRenk = const GoogleGrad().colors;

  

  static const appBarText = "Ortalama Hesapla";

  static final TextStyle appBarStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final ortalamaStringStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);

  static final ortalamaDoubleStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: anaRenk);

  static const dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static const yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
  static const bodyRenk = Colors.transparent;

  static var textKalinlik = const TextStyle(fontWeight: FontWeight.w700);
}
