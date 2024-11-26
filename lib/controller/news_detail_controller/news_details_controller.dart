import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/top_news_res_model.dart';

class NewsDetailsController with ChangeNotifier {
  bool isLoading = false;
  showdetailedNews(List<Article> topArticles) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=a3360a68ce0540eaac4f3ca4fd3ebc36",
    );
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        log(response.body);
        TopNewsResModel resmodel = topNewsResModelFromJson(response.body);
        // log("parsed data:${resmodel.articles}");
        topArticles = resmodel.articles ?? [];
        notifyListeners();
        // print(topArticles);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
