import 'dart:convert';

import 'package:flutternews/models/search_model.dart';
import 'package:http/http.dart' as http;

class SearchNews {
  List<SearchModel> results = [];

  Future<void> getResults(String query) async {
    String url = "https://newsapi.org/v2/everything?q=$query&from=2023-12-16&to=2023-12-16&sortBy=popularity&apiKey=1d2a9cd385174f788a03aa2a8fcd8f21";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status']=='ok') {
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!= null && element['description']!=null){
          SearchModel searchModel = SearchModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          results.add(searchModel);
        }
      });
    }
  }
}