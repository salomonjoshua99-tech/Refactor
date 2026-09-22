import 'package:flutter/material.dart';
import '../atoms/section_heading.dart';
import '../molecules/search_field.dart';
import '../organism/product_catalog_list.dart';
import '../organism/add_product_form.dart';
import '../template/catalog_template.dart';
/// PAGE
/// Justification: CatalogPage is the Page because it is the only
/// widget in the project that owns the actual product list
/// (_products), along with _searchQuery and _nextId. It reacts to
/// callbacks bubbled up from the organisms below it (add to cart,
/// delete, new product submission) and fills the Template's slots
/// with real, live content matching the rule that pages are the
/// only place allowed to hold the actual product list and wire real
/// data downward.
class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Map<String, dynamic>> _products = [
    {'id': 1, 'name': 'Wireless Mouse', 'price': 599.0, 'category': 'Electronics', 'icon': Icons.mouse},
    {'id': 2, 'name': 'Mechanical Keyboard', 'price': 2499.0, 'category': 'Electronics', 'icon': Icons.keyboard},
    {'id': 3, 'name': 'Ceramic Mug', 'price': 149.0, 'category': 'Home', 'icon': Icons.coffee},
    {'id': 4, 'name': 'Notebook', 'price': 79.0, 'category': 'Office', 'icon': Icons.book},
    {'id': 5, 'name': 'Desk Lamp', 'price': 899.0, 'category': 'Home', 'icon': Icons.lightbulb},
    {'id': 6, 'name': 'Backpack', 'price': 1299.0, 'category': 'Accessories', 'icon': Icons.backpack},
    {'id': 7, 'name': 'Water Bottle', 'price': 299.0, 'category': 'Accessories', 'icon': Icons.local_drink},
  ];

  static const List<String> _categories = ['Electronics', 'Home', 'Office', 'Accessories'];

  String _searchQuery = '';
  int _nextId = 8;

  void _handleAddToCart(Map<String, dynamic> product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${product['name']} to cart')),
    );
  }

  void _handleDelete(Map<String, dynamic> product) {
    setState(() {
      _products.removeWhere((p) => p['id'] == product['id']);
    });
  }

  void _handleNewProduct(Map<String, dynamic> newProductData) {
    final newProduct = {
      'id': _nextId,
      'name': newProductData['name'],
      'price': newProductData['price'],
      'category': newProductData['category'],
      'icon': Icons.inventory_2,
      'description': newProductData['description'],
    };

    setState(() {
      _products.add(newProduct);
      _nextId += 1;
      _searchQuery = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newProduct['name']} added to catalog!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _products.where((p) {
      return p['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return CatalogTemplate(
      appBar: AppBar(
        title: const Text(
          'Messy Catalog',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      searchSlot: SearchField(
        onChanged: (value) => setState(() => _searchQuery = value),
      ),
      catalogSlot: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading('Catalog'),
          const SizedBox(height: 8),
          ProductCatalogList(
            products: filteredProducts,
            onAddToCart: _handleAddToCart,
            onDelete: _handleDelete,
          ),
        ],
      ),
      formSlot: AddProductForm(
        categories: _categories,
        onSubmit: _handleNewProduct,
      ),
    );
  }
}