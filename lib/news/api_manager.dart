import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_assignment/news/strings.dart';
import 'strings.dart';
import 'news_info.dart';

class ApiManager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(Strings.finalUrl);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        var jsonMap = json.decode(jsonBody);
        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (e) {
      return newsModel;
    }
    return newsModel;
  }
}
