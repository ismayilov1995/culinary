import 'package:flutter/material.dart';

const Color kLightBgColor = Color(0xFF37A4A1);
const Color kLightPrimaryColor = Color(0xFF3B3C53);
const Color kLightHelperTC = Color(0xFF5D5D6A);
const Color kLightTextFieldBg = Color(0xFFE7E1E1);
const Color kLightCardBg = Color(0xFFFFFFFF);

const Color kDarkBgColor = Color(0xFF37A4A1);
const Color kDarkPrimaryColor = Color(0xFF3B3C53);
const Color kDarkHelperTC = Color(0xFFA4A4AA);
const Color kDarkTextFieldBg = Color(0xFF5F5F5F);
const Color kDarkCardBg = Color(0xFF111111);

final LinearGradient kLightPrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [kLightBgColor, Color(0xFF13827F)]);
final LinearGradient kLightAccentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEEC867), Color(0xFFC1913C)]);

final kLightCardShadow = BoxShadow(color: Colors.grey[400]!, blurRadius: 10);

final kDarkCardShadow = BoxShadow(color: kDarkCardBg, blurRadius: 10);

const double kAppRadius = 10.0;
