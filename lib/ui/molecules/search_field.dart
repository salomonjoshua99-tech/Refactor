import 'package:flutter/material.dart';
import '../atoms/section_heading.dart';
import '../atoms/app_text_field.dart';
/// MOLECULE
/// Justification: SearchField is a Molecule because it pairs a
/// heading atom with a text field atom to form one recognizable job
/// (a labeled search box). It remains "dumb": it reports the typed
/// value upward through onChanged and does not filter or own the
/// product list itself.
class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading('Search Products'),
        const SizedBox(height: 8),
        AppTextField(
          hintText: 'Type a product name...',
          onChanged: onChanged,
        ),
      ],
    );
  }
}