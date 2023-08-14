import 'dart:convert';

NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

String newsDataToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
  List<News> data;

  NewsData({
    required this.data,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        data: List<News>.from(json["data"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class News {
  String uuid;
  String title;
  String description;
  String imageUrl;
  DateTime publishedAt;

  News({
    required this.uuid,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
        publishedAt: DateTime.parse(json["published_at"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "description": description,
        "image_url": imageUrl,
        "published_at": publishedAt.toIso8601String(),
      };
}
