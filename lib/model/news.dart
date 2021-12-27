class News {
  List<Articles>? articles;

  News({this.articles});

  News.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((item) {
        articles!.add(Articles.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (articles != null) {
      data['articles'] = articles?.map((item) => item.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'];
    data['title'];
    data['description'];
    data['url'];
    data['urlToImage'];
    data['publishedAt'];
    data['content'];
    return data;
  }
}
