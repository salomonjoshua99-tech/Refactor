import 'package:flutter/material.dart';
import '../atoms/section_heading.dart';
import '../atoms/app_text_field.dart';

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