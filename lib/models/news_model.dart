class NewsModel {
  String sourceName;
  String date;
  String author;
  String title;
  String imageUrl;
  String description;

  NewsModel({required this.sourceName,
    required this.date,
    required this.author,
    required this.title,
    required this.imageUrl,
    required this.description});

  factory NewsModel.fromJson(Map<String, dynamic> data, int index) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];


    DateTime parsedDate =
    DateTime.tryParse('${data['articles'][index]['publishedAt']}')?? DateTime.now();
    return NewsModel(
      sourceName: '${data['articles'][index]['source']['name']}',
      date:
      '${months[parsedDate.month - 1]} ${parsedDate.day} ${parsedDate.year}',
      author: '${data['articles'][index]['author']}',
      title: '${data['articles'][index]['title']}',
      imageUrl: '${data['articles'][index]['urlToImage']}',
      description: '${data['articles'][index]['description']}',
    );
  }

  static List<NewsModel> getAllNews(Map<String, dynamic> data) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    final List<dynamic> articles = data['articles'] ?? [];

    return articles.map((article) {
      final DateTime parsedDate = DateTime.tryParse(
          article['publishedAt'] ?? '') ?? DateTime.now();

      return NewsModel(
        sourceName: article['source']['name'] ?? 'Unknown Source',
        date: '${months[parsedDate.month - 1]} ${parsedDate.day}, ${parsedDate
            .year}',
        author: article['author'] ?? 'Unknown Author',
        title: article['title'] ?? 'No Title',
        imageUrl: article['urlToImage'] ?? '',
        description: article['description'] ?? 'No Description',
      );
    }).toList();
  }
}














