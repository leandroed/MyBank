import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


// Generic widget for forms.
class Editor extends StatelessWidget {
  // Controller for acess form field value.
  final TextEditingController controller;

  // Field label.
  final String label;

  // Field input hint.
  final String hint;

  // Field icon.
  final IconData icon;

  // Initialize a field editor widget.
  Editor({
    this.controller,
    this.label,
    this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
