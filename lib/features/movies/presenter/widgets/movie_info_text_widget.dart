import 'package:flutter/material.dart';

class MovieInfoTextWidget extends StatelessWidget {
  final String label;
  final String value;
  const MovieInfoTextWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          this.label,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          this.value,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
