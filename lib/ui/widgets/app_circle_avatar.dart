import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.white),
          boxShadow: [kCardShadow],
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://i.pinimg.com/736x/89/46/30/89463056da62f4dbcb677c9310ad38bd.jpg',
              ))),
    );
  }
}
