import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/images/logo_horz.svg', height: 50));
  }
}
