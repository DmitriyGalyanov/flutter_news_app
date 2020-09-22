class NewsPieceData {
  String publisher;
  String author;
  String title;
  String description;
  String urlToNews;
  String urlToImage;
  String publishedAt;
  String content;

  NewsPieceData(
      {this.publisher,
      this.author,
      this.title,
      this.description,
      this.urlToNews,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory NewsPieceData.fromJson(json) {
    return NewsPieceData(
        publisher: json['source']['name'],
        author: json['source']['author'],
        title: json['title'],
        description: json['description'],
        urlToNews: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']);
  }

  static List<NewsPieceData> listFromJson(List json) {
    return json == null
        ? List<NewsPieceData>() //(0)
        : json.map((model) => NewsPieceData.fromJson(model)).toList();
  }
}
