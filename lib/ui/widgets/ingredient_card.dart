import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: kTextFieldBg,
        borderRadius: BorderRadius.circular(kAppRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText('Avocado', fontSize: 16, fontWeight: FontWeight.w600),
          AppText(
            '1/2 fruit',
            color: kTextColor,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
