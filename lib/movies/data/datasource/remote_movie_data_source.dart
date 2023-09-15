import 'package:cima_movies_clean/core/networking/networking_modle.dart';
import 'package:cima_movies_clean/movies/data/modles/movie_details_modle.dart';
import 'package:cima_movies_clean/movies/data/modles/movie_modle.dart';
import 'package:cima_movies_clean/movies/data/modles/recommendation_modle.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:dio/dio.dart';

import '../../../core/erorr/server_exception.dart';
import '../../../core/networking/apis_constance.dart';
import '../../domain/usecase/get_details_movie.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModle>> getNowPlaying();
  Future<List<MovieModle>> getPopular();
  Future<List<MovieModle>> getTopDated();
  Future<DetailsMovieModle> getDetails(DetailsPrammetrs prammetrs);
  Future<List<RecommendationModle>> getRecommendation(
      RecommndationPrammetrs prammetrs);
}

class RemoteMovieDataSource implements BaseRemoteMovieDataSource {
  final Dio _dio = Dio();
  @override
  Future<List<MovieModle>> getNowPlaying() async {
    final respons = await _dio.get(ApisConstance.nowPlayingMoviePath);
    if (respons.statusCode == 200) {
      return List.from(
        (respons.data[ApisConstance.results] as List).map(
          (e) => MovieModle.formJson(e),
        ),
      );
    } else {
      throw ServerException(
        netWorkingModle: NetWorkingModle.fromJson(respons.data),
      );
    }
  }

  @override
  Future<List<MovieModle>> getPopular() async {
    final respons = await _dio.get(ApisConstance.popularPath);
    if (respons.statusCode == 200) {
      return List<MovieModle>.from(
          (respons.data[ApisConstance.results] as List).map(
        (e) => MovieModle.formJson(e),
      ));
    } else {
      throw ServerException(
        netWorkingModle: NetWorkingModle.fromJson(respons.data),
      );
    }
  }

  @override
  Future<List<MovieModle>> getTopDated() async {
    final respons = await _dio.get(ApisConstance.topDatedPath);
    if (respons.statusCode == 200) {
      return List<MovieModle>.from(
        (respons.data[ApisConstance.results] as List).map(
          (e) => MovieModle.formJson(e),
        ),
      );
    } else {
      throw ServerException(
        netWorkingModle: NetWorkingModle.fromJson(respons.data),
      );
    }
  }

  @override
  Future<DetailsMovieModle> getDetails(DetailsPrammetrs prammetrs) async {
    final respons =
        await _dio.get(ApisConstance.detailsPath(prammetrs.detailsId));
    if (respons.statusCode == 200) {
      return DetailsMovieModle.fromJosn(respons.data);
    } else {
      throw ServerException(
        netWorkingModle: NetWorkingModle.fromJson(respons.data),
      );
    }
  }

  @override
  Future<List<RecommendationModle>> getRecommendation(
      RecommndationPrammetrs prammetrs) async {
    final respons = await _dio.get(
      ApisConstance.recommendationPath(prammetrs.id),
    );

    if (respons.statusCode == 200) {
      return List<RecommendationModle>.from((respons.data[ApisConstance.results]
          as List).map((e) => RecommendationModle.fromJosn(e),),);
    } else {
      throw ServerException(
          netWorkingModle: NetWorkingModle.fromJson(respons.data));
    }
  }
}
