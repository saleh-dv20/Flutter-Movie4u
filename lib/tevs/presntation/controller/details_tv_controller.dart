import 'package:cima_movies_clean/core/manager/strings_manager.dart';
import 'package:cima_movies_clean/tevs/domain/entities/details_entiti.dart';
import 'package:cima_movies_clean/tevs/domain/entities/episode_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/entities/genres_entiti.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_recommendations_entiti.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_details_usecase.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_episodes_usecase.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_tv_recommendations_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsTvController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GetDetailsUseCase getDetailsUseCase;
  final GetTvRecommendationsUseCase getTvRecommendationsUseCase;
  final GetEpisodesUseCase getEpisodesUseCase;
  DetailsTvController(this.getDetailsUseCase, this.getTvRecommendationsUseCase,
      this.getEpisodesUseCase);

  // TAB BAR PR...
  late TabController controller;
  List<Widget> list = [
    Text(
      StringManager.episodes,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    ),
    Text(
      StringManager.moreLikeThis,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    ),
  ];

  //

  // parameter
  // ignore: prefer_typing_uninitialized_variables
  late DetailsEntiti details;
  String erorrMessage = '';
  RxBool isLo = false.obs;

  //
  RxList<RecommendationsEntiti> recommendations = <RecommendationsEntiti>[].obs;
  String erorrRecommendations = '';
  RxBool isRoLo = false.obs;
//
  RxList<EpisodesEntitie> episodes = <EpisodesEntitie>[].obs;
  String erorrEpisodes = '';
  RxBool isEpLo = false.obs;

  void getDetails(int tvId ) async {
    isLo(true);
    final data = await getDetailsUseCase.execues(tvId);
    try {
      data.fold(
        (l) {
          return erorrMessage = l.message;
        },
        (r) {
          details = r;
        },
      );
    } finally {
      isLo(false);
      controller.index = 1;
    }
  }

  // Recommendaitons

  void getRecommendations(int tvId) async {
    final data = await getTvRecommendationsUseCase.execuse(tvId);
    data.fold(
      (l) {
        return erorrMessage = l.message;
      },
      (r) {
        return recommendations.value = r;
      },
    );
  }

  // Get Episodes Items..
  void getEpisodes(int tvId, int seasonNamder) async {
    isEpLo(true);
    final data = await getEpisodesUseCase.execuse(tvId, seasonNamder);
    try {
      data.fold((l) {
        return erorrEpisodes = l.message;
      }, (r) {
        return episodes.value = r;
      });
    } finally {
      isEpLo(false);
    }
  }

  String moveiTime(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  String showGenres(List<TvGenresEntiti> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: list.length);
    // controller.addListener();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
