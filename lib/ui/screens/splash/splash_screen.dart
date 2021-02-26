import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const pageID = '/splash';

  static route() => MaterialPageRoute(builder: (_) => SplashScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
