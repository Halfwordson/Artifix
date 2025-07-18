import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool fullWidth;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, size: 20) : const SizedBox.shrink(),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
