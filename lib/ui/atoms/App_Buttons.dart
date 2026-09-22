import 'package:flutter/material.dart';
/// ATOM
/// Justification: AppButton is an Atom because it is a reusable,
/// styled StatelessWidget that fires whatever callback it is given
/// without deciding what that callback does the decision of what
/// happens on press is supplied externally, keeping the atom itself
/// logic-free.
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