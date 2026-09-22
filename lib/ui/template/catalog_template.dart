import 'package:flutter/material.dart';
/// TEMPLATE
/// Justification: CatalogTemplate is a Template because it is a pure
/// layout skeleton an AppBar slot and three body slots (search,
/// catalog, form) arranged in a scrollable column with no import of
/// the product data model and no real data passed in. It only knows
/// about Widget types, never about what a "product" is, satisfying the
/// rule that templates must never import a data model directly.
class CatalogTemplate extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget searchSlot;
  final Widget catalogSlot;
  final Widget formSlot;

  const CatalogTemplate({
    super.key,
    required this.appBar,
    required this.searchSlot,
    required this.catalogSlot,
    required this.formSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchSlot,
            const SizedBox(height: 16),
            catalogSlot,
            const Divider(height: 32, thickness: 1),
            formSlot,
          ],
        ),
      ),
    );
  }
}