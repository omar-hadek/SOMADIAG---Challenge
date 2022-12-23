import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  const ControlButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: color,
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
