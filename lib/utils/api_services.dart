import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacia/models/news_model.dart';
import 'package:pharmacia/models/products_model.dart';

var base = "https://8k68e.wiremockapi.cloud";

Future<ProductPost> getPosts() async {
  Uri url = Uri.parse("$base/drugList");

  var res = await http.get(url);

  if (res.statusCode == 200) {
    return ProductPost.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<NewsPost> getNews() async {
  Uri url = Uri.parse("$base/newsList");

  var res = await http.get(url);

  if (res.statusCode == 200) {
    return NewsPost.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load news');
  }
}