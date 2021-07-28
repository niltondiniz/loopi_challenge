import 'package:flutter/material.dart';

class VerticalSpaceWidget extends StatelessWidget {
  final double height;
  const VerticalSpaceWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
