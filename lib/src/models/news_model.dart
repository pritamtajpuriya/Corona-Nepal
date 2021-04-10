// To parse this JSON data, do
//
//     final newsModel : newsModelFromJson(jsonString);

class NewsModel {
  NewsModel(
      {this.id,
      this.url,
      this.title,
      this.summary,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.source});

  String id;

  String url;
  String title;
  String source;

  String summary;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        id: json["_id"],
        url: json["url"],
        title: json["title"],
        source: json['source'],
        summary: json["summary"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]));
  }
}
