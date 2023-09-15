import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/tevs/data/datasource/base_remote_data_source.dart';
import 'package:cima_movies_clean/tevs/domain/entities/details_entiti.dart';
import 'package:cima_movies_clean/tevs/domain/entities/episode_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_recommendations_entiti.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/repository/base_tv_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/erorr/server_exception.dart';

class TvRepository extends BaseTvRepository {
  final BseTvRemoteDataSource bseTvRemoteDataSource;

  TvRepository(this.bseTvRemoteDataSource);
  @override
  Future<Either<Failure, List<TvEntitie>>> getOnTheAair() async {
    final result = await bseTvRemoteDataSource.getOnTehAir();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.netWorkingModle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEntitie>>> getPopular() async {
    final data = await bseTvRemoteDataSource.getPopular();
    try {
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.netWorkingModle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEntitie>>> getTopRated() async {
    final data = await bseTvRemoteDataSource.getTopRated();
    try {
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.netWorkingModle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DetailsEntiti>> getDetails(int tvId) async {
    final data = await bseTvRemoteDataSource.getDetails(tvId);
    try {
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.netWorkingModle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationsEntiti>>> getRecommendations(
      int tvId) async {
    final data = await bseTvRemoteDataSource.getRecommendation(tvId);
    try {
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.netWorkingModle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<EpisodesEntitie>>> getEpisodes(
      int tvId, int seasonNumber) async {
    final data = await bseTvRemoteDataSource.getEpisodes(tvId, seasonNumber);
    try {
      return Right(data);
    } on ServerException catch (e) {
    return left(ServerFailure(message: e.netWorkingModle.statusMessage));
    }
  }
}
