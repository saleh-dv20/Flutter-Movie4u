import 'package:cima_movies_clean/tevs/domain/entities/details_entiti.dart';
import 'package:cima_movies_clean/tevs/domain/entities/episode_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_recommendations_entiti.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/erorr/failure.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<TvEntitie>>> getPopular();
  Future<Either<Failure, List<TvEntitie>>> getTopRated();
  Future<Either<Failure, List<TvEntitie>>> getOnTheAair();
  Future<Either<Failure, DetailsEntiti>> getDetails(int tvId);
  Future<Either<Failure, List<RecommendationsEntiti>>> getRecommendations(
      int tvId);
  Future<Either<Failure, List<EpisodesEntitie>>> getEpisodes(
      int tvId, int seasonNumber);
}
