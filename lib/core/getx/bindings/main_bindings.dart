import 'package:cima_movies_clean/movies/presntation/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
  Get.put(MainController());
  }
}
