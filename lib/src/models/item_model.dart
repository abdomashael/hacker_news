import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'] ?? false,
        type = parsedJson['type'],
        by = parsedJson['by'],
        time = parsedJson['time'],
        text = parsedJson['text'] ?? '',
        dead = parsedJson['dead'] ?? false,
        parent = parsedJson['parent'],
        kids = parsedJson['kids'] ?? [],
        url = parsedJson['url'],
        score = parsedJson['score'],
        title = parsedJson['title'],
        descendants = parsedJson['descendants'];

  ItemModel.fromDb(Map<String, dynamic> parsedMap)
      : id = parsedMap['id'],
        deleted = parsedMap['deleted'] == 1,
        type = parsedMap['type'],
        by = parsedMap['by'],
        time = parsedMap['time'],
        text = parsedMap['text'],
        dead = parsedMap['dead'] == 1,
        parent = parsedMap['parent'],
        kids = jsonDecode(parsedMap['kids']),
        url = parsedMap['url'],
        score = parsedMap['score'],
        title = parsedMap['title'],
        descendants = parsedMap['descendants'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "deleted": deleted ? 1:0,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "dead": dead ? 1:0,
      "parent": parent,
      "kids": jsonEncode(kids) ,
      "url": url,
      "score": score,
      "title": title,
      "descendants": descendants,
    };
  }

}
