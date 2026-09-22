import 'package:flutter/material.dart';
import '../atoms/section_heading.dart';
import '../atoms/App_buttons.dart';
import '../molecules/labeled_from_field.dart';
import '../molecules/category_dropdown.dart';
/// ORGANISM
/// Justification: AddProductForm is an Organism because it owns local
/// logic controllers, the GlobalKey<FormState>, and field-level
/// validation rules which is exactly the kind of local logic
/// organisms are allowed to hold. Critically, it does not touch the
/// app's core product list: it only hands a clean, validated data map
/// upward through onSubmit, and the Page decides how to fold that into
/// the real product list. This boundary is what keeps the submit logic
/// here instead of in the Page.
class AddProductForm extends StatefulWidget {
  final List<String> categories;
  final void Function(Map<String, dynamic> newProductData) onSubmit;

  const AddProductForm({
    super.key,
    required this.categories,
    required this.onSubmit,
  });

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.categories.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit({
        'name': _nameController.text,
        'price': double.parse(_priceController.text),
        'category': _selectedCategory,
        'description': _descriptionController.text,
      });

      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedCategory = widget.categories.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading('Add New Product'),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledFormField(
                controller: _nameController,
                labelText: 'Product Name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Product name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              LabeledFormField(
                controller: _priceController,
                labelText: 'Price',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Price is required';
                  }
                  final parsed = double.tryParse(value);
                  if (parsed == null) return 'Price must be a number';
                  if (parsed <= 0) return 'Price must be greater than zero';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CategoryDropdown(
                selectedCategory: _selectedCategory,
                categories: widget.categories,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? widget.categories.first;
                  });
                },
              ),
              const SizedBox(height: 12),
              LabeledFormField(
                controller: _descriptionController,
                labelText: 'Description',
                maxLines: 3,
                alignLabelWithHint: true,
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Submit Product',
                onPressed: _handleSubmit,
                fullWidth: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}