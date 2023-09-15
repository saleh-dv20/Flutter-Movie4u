import 'package:cima_movies_clean/movies/presntation/screens/movie_screen.dart';
import 'package:cima_movies_clean/tevs/presntation/screens/tv_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxList<Widget>screens =const [
    MovieScreen(),
    TvScreen(),
  ].obs;
}
