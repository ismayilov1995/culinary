import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  SearchButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: 50,
        decoration: BoxDecoration(
            gradient: kPrimaryGradient,
            borderRadius: BorderRadius.circular(kAppRadius)),
        child: Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}
