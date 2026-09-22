import 'package:flutter/material.dart';
/// ATOM
/// Justification: ProductIconAvatar is an Atom because it is a purely
/// decorative StatelessWidget that takes an IconData and renders it
/// inside a styled box, with nothing beyond rendering logic.
class ProductIconAvatar extends StatelessWidget {
  final IconData icon;
  const ProductIconAvatar({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 32, color: Colors.indigo),
    );
  }
}