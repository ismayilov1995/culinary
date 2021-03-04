import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BriefInfoWidget extends StatelessWidget {
  BriefInfoWidget(this.prepareTime, this.person, {this.color = kTextColor});

  final String? prepareTime, person;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Icon(
          Icons.access_time,
          color: color,
          size: 16,
        ),
        SizedBox(width: 5),
        AppText(
          prepareTime,
          color: color,
        ),
        SizedBox(width: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.supervisor_account,
              color: color,
              size: 16,
            ),
            SizedBox(width: 5),
            AppText(
              person! + ' person',
              color: color,
            ),
          ],
        ),
      ],
    );
  }
}
