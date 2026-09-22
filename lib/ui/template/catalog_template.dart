import 'package:flutter/material.dart';

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