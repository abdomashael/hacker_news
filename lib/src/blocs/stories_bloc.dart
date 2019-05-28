import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';
import 'dart:async';

class StoriesBloc {

  final _repository = Repository();
  final _topIdsController = PublishSubject<List<int>>();
  final _itemsOutputController = BehaviorSubject<Map<int,Future<ItemModel>>>();
  final _itemsFetcherController = PublishSubject <int>();


  //Stream Getters
  Observable<List<int>> get topIds =>_topIdsController.stream;
  Observable<Map<int,Future<ItemModel>>> get items => _itemsOutputController.stream;

  //Sink Getters
  Function(int) get fetchItem => _itemsFetcherController.sink.add;

  StoriesBloc(){
    _itemsFetcherController.stream.transform(_itemTransformer()).pipe(_itemsOutputController);
  }
  getTopIds() async{
    final ids = await _repository.fetchTopIds();
    _topIdsController.sink.add(ids);
  }

  clearCache() async{
    return await _repository.clearCache();
  }
  _itemTransformer(){
    return ScanStreamTransformer(
            ( Map<int, Future<ItemModel>> cache,int id, index) {
              cache[id]=_repository.fetchItem(id);
              return cache;
            }
            ,<int,Future<ItemModel>>{}
            );
  }

  dispose(){
    _topIdsController.close();
    _itemsOutputController.close();
    _itemsFetcherController.close();
  }
  
}