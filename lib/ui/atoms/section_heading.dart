import 'package:flutter/material.dart';
/// ATOM
/// Justification: SectionHeading is an Atom because it is a
/// StatelessWidget that only renders styled text with no state and no
/// logic beyond what it needs to display itself, satisfying the rule
/// that atoms hold no logic and no state beyond rendering.
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