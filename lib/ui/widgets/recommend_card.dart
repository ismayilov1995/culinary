import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.only(right: 20.0),
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.4,
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kAppRadius),
        gradient: kPrimaryGradient,
      ),
      child: AppText(
        'Avocado Toast',
        fontSize: 30,
        color: Colors.white,
      ),
    );
  }
}
