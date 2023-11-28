class News {
  final String title;
  final String author;
  final String category;
  final String thumbnail;
  final String date;

  News({required this.title, required this.author, required this.category, required this.thumbnail, required this.date});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      author: json['author'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      date: json['date'],
    );
  }
}

class NewsPost {
  final List<News> newsList;

  NewsPost({required this.newsList});

  factory NewsPost.fromJson(Map<String, dynamic> json) {
    var list = json['newsList'] as List;
    List<News> newsList = list.map((news) => News.fromJson(news)).toList();

    return NewsPost(
      newsList: newsList,
    );
  }
}
