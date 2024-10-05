import 'package:flutter/material.dart';

class AttendanceButton extends StatelessWidget {
  const AttendanceButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : null,
      ),
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : null),
      ),
    );
  }
}
