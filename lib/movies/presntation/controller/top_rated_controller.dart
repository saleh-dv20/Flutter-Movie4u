import 'package:cima_movies_clean/core/base_use_case/base_use_case.dart';
import 'package:get/get.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecase/get_top_rated_usecases.dart';

class TopRatedController extends GetxController {
  final GetTopRatedUseCase getTopRatedUseCase;

  TopRatedController(this.getTopRatedUseCase);

  // Variables
  RxList<MovieEntitie> list = <MovieEntitie>[].obs;
  RxBool isLoading = false.obs;

  void _getTopRated() async {
    isLoading(true);
    try {
      final result = await getTopRatedUseCase(const NoPrammetrs());
      result.fold((l) => null, (r) {
        return list.value = r;
      });
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    _getTopRated();
    super.onInit();
  }
}
