import 'dart:convert';

import 'package:flutternews/models/slider_model.dart';
import 'package:http/http.dart' as http;

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=1d2a9cd385174f788a03aa2a8fcd8f21";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status']=='ok') {
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!= null && element['description']!=null){
          SliderModel sliderModel = SliderModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          sliders.add(sliderModel);
        }
      });
    }
  }
}