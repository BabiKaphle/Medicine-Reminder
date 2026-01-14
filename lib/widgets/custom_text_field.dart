import 'package:flutter/material.dart';
class Custometextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const Custometextfield({
    super.key,
    required this.controller,
    required this.labelText,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}