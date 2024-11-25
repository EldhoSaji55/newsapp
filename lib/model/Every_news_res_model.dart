// To parse this JSON data, do
//
//     final everyNewsResModel = everyNewsResModelFromJson(jsonString);

import 'dart:convert';

EveryNewsResModel everyNewsResModelFromJson(String str) =>
    EveryNewsResModel.fromJson(json.decode(str));

String everyNewsResModelToJson(EveryNewsResModel data) =>
    json.encode(data.toJson());

class EveryNewsResModel {
  String? status;
  int? totalResults;
  List<AllArticle>? articles;

  EveryNewsResModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory EveryNewsResModel.fromJson(Map<String, dynamic> json) =>
      EveryNewsResModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<AllArticle>.from(
                json["articles"]!.map((x) => AllArticle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class AllArticle {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  AllArticle({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory AllArticle.fromJson(Map<String, dynamic> json) => AllArticle(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  dynamic id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
