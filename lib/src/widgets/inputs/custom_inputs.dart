import 'package:flutter/material.dart';

class CustomInput {
  static InputDecoration authInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        )),
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey));
  }

  static InputDecoration searchInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }

  static InputDecoration formInputDecoration({
    String? hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        // filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.indigo.withOpacity(0.3),
        )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.indigo.withOpacity(0.3),
        )),
        // fillColor: Colors.white,
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey));
  }
}
