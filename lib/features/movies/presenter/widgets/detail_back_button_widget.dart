import 'package:flutter/material.dart';

class DetailBackButtonWidget extends StatelessWidget {
  const DetailBackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}
