import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/Every_news_res_model.dart';
import 'package:newsapp/model/top_news_res_model.dart';

class HomeScreenController with ChangeNotifier {
  bool isLoading = false;
  bool isRLoading = false;
  List<Article> topArticles = [];
  List<AllArticle> allArticles = [];
  Future gettrendingNews() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=a3360a68ce0540eaac4f3ca4fd3ebc36");
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

  // Recmmended News
  getRecommendedNews() async {
    isRLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=keyword&apiKey=a3360a68ce0540eaac4f3ca4fd3ebc36");
    try {
      var rresponse = await http.get(url);
      if (rresponse.statusCode == 200) {
        log(rresponse.body);
        EveryNewsResModel responsemodel =
            everyNewsResModelFromJson(rresponse.body);
        // log("parsed data:${resmodel.articles}");
        allArticles = responsemodel.articles ?? [];
        notifyListeners();
        // print(topArticles);
      }
    } catch (e) {
      print(e);
    }
    isRLoading = false;
    notifyListeners();
  }
}
