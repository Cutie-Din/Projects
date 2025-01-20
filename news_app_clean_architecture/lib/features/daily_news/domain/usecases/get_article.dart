import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class GetArticleUseCase implements Usecase<DataState<List<ArticleEntity>>, void> {
  @override
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
