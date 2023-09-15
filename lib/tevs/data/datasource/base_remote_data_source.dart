import 'package:cima_movies_clean/core/erorr/server_exception.dart';
import 'package:cima_movies_clean/core/networking/apis_constance.dart';
import 'package:cima_movies_clean/tevs/data/modles/details_modle.dart';
import 'package:cima_movies_clean/tevs/data/modles/episode_modle.dart';
import 'package:cima_movies_clean/tevs/data/modles/recommendations_modle.dart';

import 'package:dio/dio.dart';

import '../../../core/networking/networking_modle.dart';
import '../modles/te_modle.dart';

abstract class BseTvRemoteDataSource {
  Future<List<TvModle>> getOnTehAir();
  Future<List<TvModle>> getPopular();
  Future<List<TvModle>> getTopRated();
  Future<DetailsModle> getDetails(int tvId);
  Future<List<TvRecommendationsModle>> getRecommendation(int tvId);
  Future<List<EpisodesModle>> getEpisodes(int tvId, int seasonNumber);
}

//
class RemoteTvDataSource extends BseTvRemoteDataSource {
  final Dio _dio = Dio();
  @override
  Future<List<TvModle>> getOnTehAir() async {
    final resposns = await _dio.get(ApisConstance.onTheAirPath);
    if (resposns.statusCode == 200) {
      return List<TvModle>.from(
        (resposns.data[ApisConstance.results] as List).map(
          (e) => TvModle.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          netWorkingModle: NetWorkingModle.fromJson(resposns.data));
    }
  }

  @override
  Future<List<TvModle>> getTopRated() async {
    final respond = await _dio.get(ApisConstance.tvTopRated);
    if (respond.statusCode == 200) {
      return List<TvModle>.from(
        (respond.data[ApisConstance.results] as List).map(
          (e) => TvModle.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          netWorkingModle: NetWorkingModle.fromJson(respond.data));
    }
  }

  @override
  Future<List<TvModle>> getPopular() async {
    final respod = await _dio.get(ApisConstance.tvPopular);
    if (respod.statusCode == 200) {
      return List<TvModle>.from(
        (respod.data[ApisConstance.results] as List).map(
          (e) => TvModle.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          netWorkingModle: NetWorkingModle.fromJson(respod.data));
    }
  }

  @override
  Future<DetailsModle> getDetails(int tvId) async {
    final respon = await _dio.get(ApisConstance.tvDetails(tvId));
    if (respon.statusCode == 200) {
      return DetailsModle.fromJosn(respon.data);
    } else {
      throw ServerException(
          netWorkingModle: NetWorkingModle.fromJson(respon.data));
    }
  }

  @override
  Future<List<TvRecommendationsModle>> getRecommendation(int tvId) async {
    final respon = await _dio.get(ApisConstance.tvRecommendation(tvId));
    if (respon.statusCode == 200) {
      return List<TvRecommendationsModle>.from(
          (respon.data[ApisConstance.results] as List).map(
        (e) => TvRecommendationsModle.fromJosn(e),
      ));
    } else {
      throw ServerException(
          netWorkingModle: NetWorkingModle.fromJson(respon.data));
    }
  }

  @override
  Future<List<EpisodesModle>> getEpisodes(int tvId, int seasonNumber) async {
    final respone =
        await _dio.get(ApisConstance.tvEpisodes(tvId , seasonNumber));
    if (respone.statusCode == 200) {
      return List<EpisodesModle>.from(
        (respone.data['episodes'] as List).map(
          (e) => EpisodesModle.fromJosn(e),
        ),
      );
    } else {
      throw ServerException(
        netWorkingModle: NetWorkingModle.fromJson(respone.data),
      );
    }
  }
}
