import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_tvpoplar.dart';
import 'package:get/get.dart';

class PopularTvController extends GetxController {
  final GetTvPopularUseCase getTvPopularUseCase;

  PopularTvController(this.getTvPopularUseCase);
  // Prammetrs...
  RxList<TvEntitie> list = <TvEntitie>[].obs;
  RxBool isLoading = false.obs;
  // Methods ....
  void _getPopularTvData() async {
    isLoading(true);
    final data = await getTvPopularUseCase.execues();
    try {
      data.fold((l) => null, (r) {
        return list.value = r;
      });
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    _getPopularTvData();
    super.onInit();
  }
}
