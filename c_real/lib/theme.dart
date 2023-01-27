import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//
TextStyle CustomFont(double fontsize, double height, double letterSpacing) {
  return TextStyle(
      fontSize: fontsize,
      height: height / fontsize,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.w400);
}
TextStyle NunitoProductTitle() {
  return GoogleFonts.nunito(
      fontSize: 16,
      height: 21.82 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w700);
}
TextStyle NunitoProductKiloweight() {
  return GoogleFonts.nunito(
      color: Color(0xff0AB362),
      fontSize: 13,
      height: 17.73 / 13,
      letterSpacing: 0,
      fontWeight: FontWeight.w400);
}
TextStyle NunitoProductPrice() {
  return GoogleFonts.nunito(
      color: Color(0xff0AB362),
      fontSize: 16,
      height: 21.82 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w700);
}

