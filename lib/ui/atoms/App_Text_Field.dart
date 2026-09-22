import 'package:flutter/material.dart';
/// ATOM
/// Justification: AppTextField is an Atom because, despite having
/// several parameters, it makes no decisions of its own it only
/// renders either a TextField or TextFormField based on what it is
/// given, and holds no controller state, validation rules, or business
/// logic internally.
class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool alignLabelWithHint;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText = '',
    this.labelText = '',
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      hintText: hintText.isEmpty ? null : hintText,
      labelText: labelText.isEmpty ? null : labelText,
      alignLabelWithHint: alignLabelWithHint,
    );

    if (validator != null) {
      return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: decoration,
        validator: validator,
      );
    }

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: decoration,
    );
  }
}