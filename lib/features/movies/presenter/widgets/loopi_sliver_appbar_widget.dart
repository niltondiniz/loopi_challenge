import 'package:flutter/material.dart';

class LoopiSliverAppBarWidget extends StatelessWidget {
  const LoopiSliverAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 100.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 8, bottom: 8, right: 8),
        centerTitle: true,
        background: Container(
          color: Theme.of(context).primaryColor,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
              child: Image.asset("assets/images/loopi_logo.png"),
            ),
            Text(
              ' Movies',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
