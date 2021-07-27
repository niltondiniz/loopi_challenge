import 'package:flutter/material.dart';

class MovieInfoText extends StatelessWidget {
  final String label;
  final String value;
  const MovieInfoText({
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
