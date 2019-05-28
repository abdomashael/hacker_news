import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';
import 'abstract_news_provider.dart';

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) break;
    }

    for (var cache in caches) {
      if ((cache as Source) != source) cache.addItem(item);
    }

    return item;
  }

  clearCache()async{
    for(var cache in caches){
      await cache.clear();
    }
  }
}
