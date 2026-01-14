import 'package:flutter/material.dart';
class CustomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomeButton({
    super.key,
    required this.title,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        minimumSize: const Size(double.infinity, 50),
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
         )     ),
          onPressed: onPressed,
           child: Text(title,
           style: const TextStyle(fontSize: 18),
           ),
    );
  }
}