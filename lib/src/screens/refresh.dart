import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class Refresh extends StatelessWidget {
  Widget child;

  Refresh({this.child});

  @override
  Widget build(BuildContext context) {
    StoriesBloc bloc = StoriesProvider.of(context);

    return RefreshIndicator(
      onRefresh: () async{
        await bloc.clearCache();
        await bloc.getTopIds();
      },
      child: child,
    );
  }
}
