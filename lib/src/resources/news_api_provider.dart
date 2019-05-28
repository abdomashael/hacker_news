import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import 'abstract_news_provider.dart';

final _root = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider implements Source  {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    final response = await client.get("$_root/topstories.json");
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }


  @override
  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get("$_root/item/$id.json");
    final parsedJson = json.decode(response.body);
    final item = ItemModel.fromJson(parsedJson);

    return item;
  }





}
