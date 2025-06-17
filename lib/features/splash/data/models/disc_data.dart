import 'dart:math';
import 'package:flutter/material.dart';

class DiscData {
  final Color color;
  final double size;
  final Alignment alignment;
  final Duration duration;

  static final Random _rng = Random();

  DiscData()
      : color = Colors.primaries[_rng.nextInt(Colors.primaries.length)].withOpacity(0.4),
        size = _rng.nextDouble() * 50 + 20, // Taille entre 20 et 70
        alignment = Alignment(
          _rng.nextDouble() * 2 - 1, // Entre -1 et 1 pour x
          _rng.nextDouble() * 2 - 1, // Entre -1 et 1 pour y
        ),
        duration = Duration(milliseconds: 800 + _rng.nextInt(1200)); // entre 800 et 2000 ms
}
