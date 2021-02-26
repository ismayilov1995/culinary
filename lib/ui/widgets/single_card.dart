import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SingleCardStruct extends StatelessWidget {
  SingleCardStruct(this.title, {@required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: AppText(
            title,
            fontSize: 20,
            font: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        child,
      ],
    );
  }
}
