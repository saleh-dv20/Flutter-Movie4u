import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/movies/domain/entities/details.dart';
import 'package:cima_movies_clean/movies/domain/entities/movie.dart';
import 'package:cima_movies_clean/movies/domain/entities/recommendation.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_details_movie.dart';
import 'package:dartz/dartz.dart';

import '../usecase/get_recommendation_use_case.dart';

abstract class BaseMovieRepository {
 Future<Either<Failure, List<MovieEntitie>>> getNowPlaying();
 Future<Either<Failure, List<MovieEntitie>>> getPopuler();
 Future<Either<Failure, List<MovieEntitie>>> getTopRated();
 Future<Either<Failure, DetailsMovieEntitie>> getDetails(DetailsPrammetrs prammetrs);
  Future<Either<Failure, List<RecommendationEntitie>>> getRecommendation(RecommndationPrammetrs prammetrs);

}
