import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import '../screens/news_details.dart';
import 'news_loading container.dart';
import '../screens/screens_args/details_args.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    print(itemId);

    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder:
              (BuildContext context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) return LoadingContainer();

            return buildTile(itemSnapshot.data, context);
          },
        );
      },
    );
  }

  Widget buildTile(ItemModel data, BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(data.title),
          subtitle: Text("${data.score} votes"),
          trailing: Column(
            children: <Widget>[
              Icon(Icons.comment),
              Text("${data.descendants}")
            ],
          ),
          onTap:(){ onTileTap(context,data.id);},
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }

  onTileTap(BuildContext context, int id) {
    // When the user taps the button, navigate to the specific rout
    // and provide the arguments as part of the RouteSettings.
    Navigator.pushNamed(
      context,
      NewsDetails.routeName,
      arguments: DetailsArgs(id: id),
    );
  }
}
