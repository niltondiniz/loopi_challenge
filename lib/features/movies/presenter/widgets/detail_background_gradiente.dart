import 'package:flutter/material.dart';

class DetailbackgroundGradiente {
  // ignore: non_constant_identifier_names
  static BoxDecoration GetBackgroundGradientMask() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black.withOpacity(0),
          Colors.black.withOpacity(0),
          Colors.black.withOpacity(0.9),
          Colors.black.withOpacity(1),
        ],
      ),
    );
  }
}
