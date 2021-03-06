import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
    this.hintText, {
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.maxLines,
    this.minLines = 1,
    this.keyboardType,
    this.enabled = true,
    this.validator,
  });

  final String hintText;
  final Widget? prefixIcon, suffixIcon;
  final int? maxLines, minLines;
  final bool? enabled;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged? onChanged, onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: kTextFieldBg,
          focusColor: kTextFieldBg,
          contentPadding: maxLines == null
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(kAppRadius))),
    );
  }
}
