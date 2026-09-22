import 'package:flutter/material.dart';
import 'product_card.dart';

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