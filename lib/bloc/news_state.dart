import 'package:news_app/models/news_model.dart';

abstract class NewsState {}

class IntialNewsState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String errorMsg;

  NewsErrorState(this.errorMsg);
}

class NewsSuccessState extends NewsState {
  NewsModel newsModel;

  NewsSuccessState(this.newsModel);
}

class AllNewsSuccessState extends NewsState {
  List<NewsModel> newsModel;

  AllNewsSuccessState(this.newsModel);
}
