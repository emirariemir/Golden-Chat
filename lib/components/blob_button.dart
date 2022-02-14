import 'package:flutter/material.dart';

class BlobButton extends StatelessWidget {
  BlobButton({required this.title, required this.color, required this.onTap});

  final Color color;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 0,
        color: color,
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
