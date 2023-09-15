import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';
import 'package:get/get.dart';
import '../../domain/usecase/get_on_the_air_usecase.dart';

class TvController extends GetxController {
  final GetOnTheAirUseCase getOnTheAirUseCase;

  TvController(
    this.getOnTheAirUseCase,
  );

  // Prammetrs..
  RxList<TvEntitie> onTheAir = <TvEntitie>[].obs;
  RxBool isOnLoading = false.obs;

  // Functions ........
  void _getOnTheAirData() async {
    isOnLoading(true);
    final data = await getOnTheAirUseCase.execues();
    try {
      data.fold((l) => null, (r) {
        return onTheAir.value = r;
      });
    } finally {
      isOnLoading(false);
    }
    
  }

  @override
  void onInit() {
    _getOnTheAirData();
    super.onInit();
  }
}
