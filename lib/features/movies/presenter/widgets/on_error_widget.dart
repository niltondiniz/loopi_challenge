import 'package:flutter/material.dart';

class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ops! we have a problem, try again later.',
      style: Theme.of(context).textTheme.caption,
    );
  }
}
