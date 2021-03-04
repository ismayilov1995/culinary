import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SingleCardStruct extends StatelessWidget {
  SingleCardStruct(this.title, {required this.child, this.padding});

  final String title;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? EdgeInsets.all(20.0),
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
