import 'package:flutter/material.dart';
/// ATOM
/// Justification: DeleteIconButton is an Atom for the same reason as
/// AppButton: it renders an icon button and forwards a tap to a
/// callback, with no internal logic of its own.
class DeleteIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  const DeleteIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.delete_outline, color: Colors.red),
    );
  }
}