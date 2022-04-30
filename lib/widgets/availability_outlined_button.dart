import 'package:flutter/material.dart';

class AvailabilityOutlinedButton extends StatelessWidget {
  final bool isActive;
  final String title;
  final VoidCallback onPressed;
  const AvailabilityOutlinedButton(
      {required this.isActive,
      required this.title,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = isActive ? Colors.deepPurple : Colors.grey;
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(title),
      style: OutlinedButton.styleFrom(
        primary: color,
        side: BorderSide(
          color: color,
        ),
        shape: const StadiumBorder(),
      ),
    );
  }
}
