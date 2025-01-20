import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'remote_article_state.dart';

class RemoteArticleCubit extends Cubit<RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleCubit(this._getArticleUseCase) : super(const RemoteArticlesLoading());

  Future<void> fetchArticles() async {
    emit(const RemoteArticlesLoading()); // Phát trạng thái loading

    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!)); // Phát trạng thái thành công
    } else if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!)); // Phát trạng thái lỗi
    }
  }
}
