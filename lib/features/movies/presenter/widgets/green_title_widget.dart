import 'package:flutter/material.dart';

class GreenTitleWidget extends StatelessWidget {
  final String text;
  const GreenTitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
