import 'package:cima_movies_clean/tevs/presntation/controller/popular_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/top_rated_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/tv_controller.dart';
import 'package:get/get.dart';

import '../../../tevs/presntation/controller/details_tv_controller.dart';
import '../../services/services_locator.dart';

class TvBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TvController(sl()));
    Get.lazyPut(() => PopularTvController(sl()));
    Get.lazyPut(() => TopRatedTvController(sl()));
    Get.lazyPut(() => DetailsTvController(sl(), sl(), sl()));
  }
}
