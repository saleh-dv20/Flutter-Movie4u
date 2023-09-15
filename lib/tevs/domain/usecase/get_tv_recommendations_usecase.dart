import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_recommendations_entiti.dart';
import 'package:cima_movies_clean/tevs/domain/repository/base_tv_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvRecommendationsUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvRecommendationsUseCase(this.baseTvRepository);

  // execues method
  Future<Either<Failure, List<RecommendationsEntiti>>> execuse(int tvId) async {
    return await baseTvRepository.getRecommendations(tvId);
  }
}
