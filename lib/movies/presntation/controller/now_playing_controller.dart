import 'package:cima_movies_clean/core/base_use_case/base_use_case.dart';
import 'package:cima_movies_clean/movies/domain/entities/movie.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_now_playing_usecases.dart';
import 'package:get/get.dart';

class NowPlayingController extends GetxController {
  final GetNowPlayingUseCase getNowPlayingUseCase;

  NowPlayingController(this.getNowPlayingUseCase);

  // Variables here
  RxList<MovieEntitie> list = <MovieEntitie>[].obs;
  RxBool isLoading = false.obs;

  void _getNowPlaying() async {
    isLoading(true);
    final result = await getNowPlayingUseCase(const NoPrammetrs());
    try {
      result.fold((l) => null, (r) {
        return list.value = r;
      });
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    _getNowPlaying();
    super.onInit();
  }
}
