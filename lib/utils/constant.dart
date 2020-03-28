import 'package:flutter/material.dart';

/* Colors */
final kprimary = Color(0xff459ee8);
final ksecondary = const Color(0xffEABE0B);
final kwhite = const Color(0xfff6f7f7);
final kdark = const Color(0xff262627);

/* Text Style */
TextStyle kStyle1 = TextStyle(
  fontSize: 20.0,
  color: Color(0xff262627),
  fontWeight: FontWeight.bold,
  letterSpacing: 1.6,
);

TextStyle kStyle2 = TextStyle(
  fontSize: 16.0,
  color: Colors.grey[400],
  fontWeight: FontWeight.w600,
  letterSpacing: 1.0,
);

/* Text Decoration */
const TextInputDecoration = InputDecoration(
    fillColor: Color(0xFFFAFAFA),
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffDEDEDE), width: 2.0)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff64C4ED), width: 2.0),
    ));
