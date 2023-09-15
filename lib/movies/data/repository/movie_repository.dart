import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/core/erorr/server_exception.dart';
import 'package:cima_movies_clean/movies/data/datasource/remote_movie_data_source.dart';
import 'package:cima_movies_clean/movies/domain/entities/details.dart';
import 'package:cima_movies_clean/movies/domain/entities/movie.dart';
import 'package:cima_movies_clean/movies/domain/entities/recommendation.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_details_movie.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/base_movies_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MovieRepository(this.baseRemoteMovieDataSource);
  @override
  Future<Either<Failure, List<MovieEntitie>>> getNowPlaying() async {
    final respons = await baseRemoteMovieDataSource.getNowPlaying();
    try {
      return Right(respons);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.netWorkingModle.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntitie>>> getPopuler() async {
    final respons = await baseRemoteMovieDataSource.getPopular();
    try {
      return Right(respons);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.netWorkingModle.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntitie>>> getTopRated() async {
    final respons = await baseRemoteMovieDataSource.getTopDated();
    try {
      return Right(respons);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.netWorkingModle.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, DetailsMovieEntitie>> getDetails(
      DetailsPrammetrs prammetrs) async {
    final respons = await baseRemoteMovieDataSource.getDetails(prammetrs);
    try {
      return Right(respons);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.netWorkingModle.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntitie>>> getRecommendation(
      RecommndationPrammetrs prammetrs) async {
    final respon = await baseRemoteMovieDataSource.getRecommendation(prammetrs);
    try {
      return Right(respon);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.netWorkingModle.statusMessage));
    }
  }
}
