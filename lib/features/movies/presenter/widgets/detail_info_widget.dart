import 'package:flutter/material.dart';

class DetailInfoWidget extends StatelessWidget {
  final String value;
  final String label;
  const DetailInfoWidget({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.button,
        ),
      ],
    );
  }
}
