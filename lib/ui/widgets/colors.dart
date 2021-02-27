import 'package:flutter/material.dart';

const Color kBgColor = Color(0xFF37A4A1);
const Color kTextColor = Color(0xFF5D5D6A);
const Color kTextFieldBg = Color(0xFFE7E1E1);
final LinearGradient kPrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [kBgColor, Color(0xFF13827F)]);
final LinearGradient kAccentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEEC867), Color(0xFFC1913C)]);

final kCardShadow = BoxShadow(color: Colors.grey[400], blurRadius: 10);

const double kAppRadius = 10.0;
