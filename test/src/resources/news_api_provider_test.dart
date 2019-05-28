import 'package:news/src/resources/news_api_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import "package:test/test.dart";
import 'dart:convert';

void main(){
  test("FetchTopIds returns a list of ids", () async{
    final newsProvider = NewsApiProvider();

    MockClient mockClient = MockClient((request) async{
      return Response(json.encode([1,2,3,4,5]),200);
    });

    newsProvider.client = mockClient;

    final ids = await newsProvider.fetchTopIds();

    expect(ids, [1,2,3,4,5]);

   });
}