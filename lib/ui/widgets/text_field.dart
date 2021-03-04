import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(this.hintText,
      {required this.prefixIcon, required this.onChanged});

  final String hintText;
  final Widget prefixIcon;

  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: kTextFieldBg,
          focusColor: kTextFieldBg,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(kAppRadius))),
    );
  }
}
