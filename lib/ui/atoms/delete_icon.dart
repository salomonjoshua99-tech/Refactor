import 'package:flutter/material.dart';

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