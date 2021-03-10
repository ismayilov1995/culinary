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
        color: Theme.of(context).textFieldBG,
        borderRadius: BorderRadius.circular(kAppRadius),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            'assets/images/egg.png',
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('Egg', fontSize: 16, fontWeight: FontWeight.w600),
              AppText(
                '1/2 fruit',
                color: Theme.of(context).helperTextColor,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
