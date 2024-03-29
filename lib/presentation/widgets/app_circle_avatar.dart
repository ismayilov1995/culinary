import 'package:flutter/material.dart';
import 'package:culinary_app/core/themes/app_theme.dart';

class AppCircleAvatar extends StatelessWidget {
  AppCircleAvatar({required this.imagePath, this.diameter = 50});

  final String imagePath;
  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Theme.of(context).recipeCardBG),
          boxShadow: [Theme.of(context).cardShadow],
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imagePath,
              ))),
    );
  }
}
