import 'package:flutter/material.dart';
/// ATOM
/// Justification: PriceText is an Atom because formatting a number
/// into a currency string is presentation, not business logic it
/// holds no state and makes no decisions about what the price means,
/// only how it looks.
class PriceText extends StatelessWidget {
  final double price;
  const PriceText(this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'PHP ${price.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    );
  }
}