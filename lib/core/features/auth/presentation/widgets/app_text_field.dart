import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Icon icon;
  final String? Function(String?)? validator;
  final bool obscure;
  final TextInputType? keyboardType;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.validator,
    this.obscure = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscure,
      validator: validator ??
          (value) {
            if (value == null || value.trim().isEmpty) return 'الحقل مطلوب';
            return null;
          },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '${label}',
          prefixIcon: icon),
    );
  }
}
