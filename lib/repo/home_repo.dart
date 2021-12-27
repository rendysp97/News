import 'package:news/model/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class Network {
  Future<List<Articles>> getData();
}

class Fetching extends Network {
  @override
  Future<List<Articles>> getData() async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=bb1b16fa0d4546a494e2b9ab69d8a596';

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      List<Articles>? articles = News.fromJson(data).articles;

      return articles!;
    } else {
      throw Exception();
    }
  }
}
