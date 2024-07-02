import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final ValueChanged<String> onChanged;

  CustomTextField({required this.label, this.isPassword = false, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
    );
  }
}
