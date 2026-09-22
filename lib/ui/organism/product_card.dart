import 'package:flutter/material.dart';
import '../atoms/icon_avatar.dart';
import '../atoms/price_text.dart';
import '../atoms/App_buttons.dart';
import '../atoms/delete_icon.dart';
/// ORGANISM
/// Justification: ProductCard is an Organism because it is a distinct,
/// complex, recognizable section of UI icon, name, category, price,
/// and two actions composed from several atoms. It has its own
/// identity as "the product card," but per the rule that organisms
/// should not directly own the app's core data, it only receives a
/// single product map and reports actions upward via callbacks rather
/// than owning or mutating the product list.
///
/// Note on uncertainty: the name and category below are left as plain
/// inline Text rather than their own atom files, since each is used in
/// exactly one place with no reuse elsewhere in the app. This was a
/// judgment call a stricter reading could expect these extracted
/// too, since they play a role visually similar to PriceText, which
/// *was* pulled into its own atom.
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ProductIconAvatar(icon: product['icon'] as IconData),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'] as String,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  product['category'] as String,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                PriceText(product['price'] as double),
              ],
            ),
          ),
          Column(
            children: [
              AppButton(label: 'Add to Cart', onPressed: onAddToCart),
              const SizedBox(height: 6),
              DeleteIconButton(onPressed: onDelete),
            ],
          ),
        ],
      ),
    );
  }
}