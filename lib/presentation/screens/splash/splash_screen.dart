import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const pageID = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
