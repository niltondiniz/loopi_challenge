import 'package:flutter/material.dart';

class DetailActionWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? action;
  const DetailActionWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Column(
        children: [
          Icon(icon),
          Text(
            text,
            style: Theme.of(context).textTheme.button,
          ),
        ],
      ),
    );
  }
}
