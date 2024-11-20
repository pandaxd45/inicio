import 'package:flutter/material.dart';

const Color _colorPersonal = Color(0XFF5C11D4);
const List<Color> _coloresTemas = [
  _colorPersonal,
  Colors.black,
  Colors.white,
  Colors.redAccent,
  Colors.yellowAccent,
  Colors.greenAccent,
  Colors.blueAccent,
  Colors.orangeAccent,
  Colors.purpleAccent,
  Colors.brown,
  Colors.pinkAccent,
];

class AppTema {
  // Atributos
  final int selectorColor;

  // Constructor
  AppTema({this.selectorColor = 0})
      : assert(selectorColor >= 0 && selectorColor <= _coloresTemas.length - 1,
            'Los colores existentes son ${_coloresTemas.length}');

  ThemeData tema() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _coloresTemas[selectorColor],
      // brightness: Brightness.dark,
    );
  }
}
