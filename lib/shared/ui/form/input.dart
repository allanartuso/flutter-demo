import 'package:flutter/material.dart';

class DemoTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? initialValue;
  final String? errorText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const DemoTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
