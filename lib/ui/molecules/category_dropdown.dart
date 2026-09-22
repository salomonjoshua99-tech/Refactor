import 'package:flutter/material.dart';
/// MOLECULE
/// Justification: CategoryDropdown is a Molecule because it is a label
/// and a selectable input working together as one functional unit. It
/// manages a list of options and reacts to a selection, which is more
/// than a bare atom does, but it does not know why a category matters
/// or what happens after selection no business logic, no data
/// ownership.
class CategoryDropdown extends StatelessWidget {
  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedCategory,
      decoration: const InputDecoration(labelText: 'Category'),
      items: categories
          .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
          .toList(),
      onChanged: onChanged,
    );
  }
}