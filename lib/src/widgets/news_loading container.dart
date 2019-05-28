import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: greyContainer(),
          subtitle: greyContainer(),
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }

  Widget greyContainer() {
    return Container(
      color: Colors.grey[100],
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
    );
  }
}
