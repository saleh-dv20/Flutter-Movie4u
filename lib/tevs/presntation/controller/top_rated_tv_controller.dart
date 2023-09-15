import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_tv_top_rated.dart';
import 'package:get/get.dart';

class TopRatedTvController extends GetxController {
  final GetTvTopRatedUseCase getTvTopRatedUseCase;

  TopRatedTvController(this.getTvTopRatedUseCase);

  RxList<TvEntitie> list = <TvEntitie>[].obs;
  RxBool isLoading = false.obs;

  // Functions ........
  void _getTopRatedData() async {
    isLoading(true);
    final data = await getTvTopRatedUseCase.exeuse();
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
    _getTopRatedData();
    super.onInit();
  }
}
