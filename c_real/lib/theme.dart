import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle CustomFont(double fontsize, double height, double letterSpacing) {
  return TextStyle(
      fontSize: fontsize,
      height: height / fontsize,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.w400);
}

TextStyle NonCustomFont() {
  return TextStyle(
      fontSize: 12,
      height: 12 / 12,
      letterSpacing: 0,
      fontWeight: FontWeight.w400);
}
