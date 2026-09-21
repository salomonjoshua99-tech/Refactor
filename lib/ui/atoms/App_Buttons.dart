import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        padding: fullWidth ? const EdgeInsets.symmetric(vertical: 14) : null,
      ),
      child: Text(
        label,
        style: fullWidth
            ? const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)
            : null,
      ),
    );
    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}