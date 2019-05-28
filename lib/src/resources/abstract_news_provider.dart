import '../models/item_model.dart';

abstract class Source {

  Future <ItemModel> fetchItem (int id);
  Future<List<int>> fetchTopIds() ;



}

abstract class Cache{
  void addItem(ItemModel item);

  clear() {}

}