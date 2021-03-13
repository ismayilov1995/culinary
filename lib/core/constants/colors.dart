import 'package:flutter/material.dart';

const Color lightBackgroundColor = Color(0xFFFFFFFF);
const Color lightPrimaryColor = Color(0xFF3B3C53);
const Color lightAccentColor = Color(0xFF2D767F);
const Color lightHelperTC = Color(0xFF5D5D6A);
const Color lightTextFieldBg = Color(0xFFE7E1E1);
const Color lightCardBg = Color(0xFFFFFFFF);

const Color darkBackgroundColor = Color(0xFF131212);
const Color darkPrimaryColor = Color(0xFF430D27);
const Color darkAccentColor = Color(0xFFC94E4E);
const Color darkHelperTC = Color(0xFFA4A4AA);
const Color darkTextFieldBg = Color(0xFF582233);
const Color darkCardBg = darkPrimaryColor;

final LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [lightPrimaryColor, Color(0xFF13827F)]);

final LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEEC867), Color(0xFFC1913C)]);

final kLightCardShadow =
    BoxShadow(color: lightAccentColor.withOpacity(0.5), blurRadius: 10);

final kDarkCardShadow = BoxShadow(color: darkCardBg, blurRadius: 10);

const double kAppRadius = 14.0;
