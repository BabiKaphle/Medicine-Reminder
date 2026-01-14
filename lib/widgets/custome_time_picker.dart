import 'package:flutter/material.dart';
class CustomeTimePicker extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final VoidCallback onpickTime;
  final Color buttonColor;
  final TextStyle timeTextStyle;

  const CustomeTimePicker({
    super.key,
    required this.selectedTime,
    required this.onpickTime,
    this.buttonColor = Colors.orange,
    this.timeTextStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          selectedTime == null ? 'No time selected'
          : 'Time: ${selectedTime!.format(context)}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 20,
        ),
        
        ElevatedButton(
          
          onPressed: onpickTime,
          child: const Text('Pick Time'),
          ),
    
      ],
    );
  }
}