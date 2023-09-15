import 'package:cima_movies_clean/movies/domain/entities/recommendation.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_details_movie.dart';
import 'package:get/get.dart';

import '../../domain/entities/genres.dart';
import '../../domain/usecase/get_recommendation_use_case.dart';

class DetailsController extends GetxController {
  final GetDetailsMovieUseCase getDetailsMovieUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  DetailsController(this.getDetailsMovieUseCase, this.getRecommendationUseCase);

  // Prammeters..
  // ignore: prefer_typing_uninitialized_variables
  late var detailsData;
  RxBool isLoading = false.obs;
  RxList<RecommendationEntitie> list = <RecommendationEntitie>[].obs;
  RxBool recoLoading = false.obs;
  // Functions ...
  void getDetailsMovie(DetailsPrammetrs prammetrs) async {
    isLoading(true);
    final respons = await getDetailsMovieUseCase(prammetrs);
    try {
      respons.fold((l) => null, (r) {
        return detailsData = r;
      });
    } finally {
      isLoading(false);
    }
  }

  void getRecommendationData(RecommndationPrammetrs prammetrs) async {
    recoLoading(true);
    final respons = await getRecommendationUseCase(prammetrs);
    try {
      respons.fold((l) => null, (r) {
        return list.value = r;
      });
    } finally {
      recoLoading(false);
    }
   
  }

// Anther  Logic ....
  String moveiTime(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  String showGenres(List<GenresEntitie> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
  // Getters functions...
}
