import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecipeHorizontalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kAppRadius),
              boxShadow: [
                BoxShadow(color: Colors.grey[400], blurRadius: 10),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Russian Salad',
                fontSize: 22,
                font: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
              Icon(Icons.grade, color: Colors.yellow[600]),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: kTextColor,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      AppText(
                        '5 min',
                        color: kTextColor,
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: kTextColor,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      AppText(
                        '2 person',
                        color: kTextColor,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: 10,
            right: 20,
            child: Image.asset(
              'assets/images/haram1.png',
              height: 120,
              width: 120,
            ))
      ],
    );
  }
}
