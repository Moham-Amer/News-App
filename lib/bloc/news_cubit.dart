import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_state.dart';
import '../core/server_manager.dart';
import '../models/news_model.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit()
      : super(
          IntialNewsState(),
        );

  Future getNewsData(int index) async {
    emit(
      NewsLoadingState(),
    );
    try {
      NewsModel newsModel = await getNews(index);
      emit(
        NewsSuccessState(newsModel),
      );
      return newsModel;
    } catch (e) {
      emit(
        NewsErrorState(
          e.toString(),
        ),
      );
    }
  }

  Future getAllNewsData() async {
    emit(
      NewsLoadingState(),
    );
    try {
      List<NewsModel> newsModelList = await getAllNews();
      emit(
        AllNewsSuccessState(newsModelList),
      );
      return newsModelList;
    } catch (e) {
      emit(
        NewsErrorState(
          e.toString(),
        ),
      );
    }
  }
}
