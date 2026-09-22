import 'package:flutter/material.dart';
import 'product_card.dart';
/// ORGANISM
/// Justification: ProductCatalogList is an Organism because it is a
/// composed section built from repeated ProductCard organisms. It
/// displays whatever product list it is handed and forwards card-level
/// actions upward, but it never owns or mutates the core data itself,
/// keeping data ownership at the Page level as required.
class ProductCatalogList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final void Function(Map<String, dynamic> product) onAddToCart;
  final void Function(Map<String, dynamic> product) onDelete;

  const ProductCatalogList({
    super.key,
    required this.products,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) {
        return ProductCard(
          product: product,
          onAddToCart: () => onAddToCart(product),
          onDelete: () => onDelete(product),
        );
      }).toList(),
    );
  }
}