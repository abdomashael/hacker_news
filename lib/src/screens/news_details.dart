import 'package:flutter/material.dart';
import 'screens_args/details_args.dart';

class NewsDetails extends StatelessWidget{
  static const routeName = '/newsDetails';

  @override
  Widget build(BuildContext context) {
    final DetailsArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Center(child: Text(args.id.toString()),),
    );
  }

}