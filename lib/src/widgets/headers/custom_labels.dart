import 'package:flutter/material.dart';

class CustomLabels {
  // final String? texto;

  // const CustomLabels({this.texto});

  static Padding h1({required String texto}) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 15, bottom: 10),
      child: Text(texto,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 18,
              fontWeight: FontWeight.bold)),
    );
  }

  static Padding h2({required String texto}) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 15, bottom: 10),
      child: Text(texto,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 15,
              fontWeight: FontWeight.bold)),
    );
  }

  static Padding h3({required String texto}) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 15, bottom: 10),
      child: Text(texto,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 12,
              fontWeight: FontWeight.w500)),
    );
  }
}
