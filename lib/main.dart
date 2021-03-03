import 'package:culinary_app/ui/widgets/colors.dart';
import 'package:flutter/material.dart';

import 'services/helper/helper.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culinary app',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRouting.router,
    );
  }
}

