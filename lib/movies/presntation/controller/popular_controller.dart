import 'package:cima_movies_clean/core/base_use_case/base_use_case.dart';
import 'package:get/get.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecase/get_popular_usecases.dart';

class PopularController extends GetxController {
  final GetPopularUseCase getPopularUseCase;

  PopularController(this.getPopularUseCase);

  // Variables ...
  RxList<MovieEntitie> populaList = <MovieEntitie>[].obs;
  RxBool isLoading = false.obs;
  String message = '';

  void _getPouplarMovie() async {
    isLoading(true);
    try {
      final result = await getPopularUseCase(const NoPrammetrs());
      result.fold((l) {
        return null;
      }, (r) {
        return populaList.value = r;
      });
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    _getPouplarMovie();
    super.onInit();
  }
}
