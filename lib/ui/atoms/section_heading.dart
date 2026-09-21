import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String text;
  const SectionHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}