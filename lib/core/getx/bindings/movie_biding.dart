import 'package:cima_movies_clean/movies/presntation/controller/details_controller.dart';
import 'package:cima_movies_clean/movies/presntation/controller/top_rated_controller.dart';
import 'package:get/get.dart';

import '../../services/services_locator.dart';
import '../../../movies/presntation/controller/now_playing_controller.dart';
import '../../../movies/presntation/controller/popular_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NowPlayingController(sl()));
    Get.put(PopularController(sl()));
    Get.put(TopRatedController(sl()));
    Get.lazyPut(()=>DetailsController(sl(), sl()));
  }
}
