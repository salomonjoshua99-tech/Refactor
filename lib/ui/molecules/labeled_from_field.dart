import 'package:flutter/material.dart';
import '../atoms/app_text_field.dart';
/// MOLECULE
/// Justification: LabeledFormField is a Molecule because it combines
/// the AppTextField atom with a validator "shape" appropriate for a
/// form field. It does not decide what the validation rules are
/// those are passed in so it holds no business logic, only a small,
/// specific composition job, which fits the rule that molecules may
/// hold local UI state but never business logic.
class LabeledFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool alignLabelWithHint;

  const LabeledFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.validator,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: labelText,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      alignLabelWithHint: alignLabelWithHint,
    );
  }
}