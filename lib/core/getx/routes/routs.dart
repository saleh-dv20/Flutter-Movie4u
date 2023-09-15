import 'package:cima_movies_clean/core/getx/bindings/main_bindings.dart';
import 'package:cima_movies_clean/core/getx/bindings/tv_dindings.dart';
import 'package:cima_movies_clean/movies/presntation/screens/main_screen.dart';
import 'package:cima_movies_clean/movies/presntation/screens/movie_screen.dart';
import 'package:cima_movies_clean/movies/presntation/screens/popular_screen.dart';
import 'package:cima_movies_clean/movies/presntation/screens/toprated_screen.dart';
import 'package:cima_movies_clean/tevs/presntation/screens/popular_tv_screen.dart';
import 'package:cima_movies_clean/tevs/presntation/screens/top_rated_tv_screen.dart';
import 'package:cima_movies_clean/tevs/presntation/screens/tv_screen.dart';
import 'package:get/get.dart';

import '../bindings/movie_biding.dart';

class RoutePage {
  static List<GetPage<dynamic>> pageRoute = [
    GetPage(
      name: RouteName.mainScreen,
      page: () => const MainScreen(),
      bindings: [
        MainBinding(),
        MovieBinding(),
        TvBinding(),
      ],
    ),

    // Moviess
    GetPage(
      name: RouteName.movieScreen,
      page: () => const MovieScreen(),
    ),

    GetPage(
      name: RouteName.popularScreen,
      page: () => const PopularScreen(),
    ),

    GetPage(
      name: RouteName.topRateScreen,
      page: () => const TopRatedScreen(),
    ),

    // Tv Pages......
    GetPage(
      name: RouteName.tvScreen,
      page: () => const TvScreen(),
    ),
    GetPage(
      name: RouteName.tvTopRatedScreen,
      page: () => const TopRatedTvScreen(),
    ),

    GetPage(
      name: RouteName.tvPopularScreen,
      page: () => const PopularTvScreen(),
    ),
  ];
}

class RouteName {
  static const String mainScreen = '/mainScreen';
  static const String movieScreen = '/movieScreen';
  static const String popularScreen = '/popularScreen';
  static const String topRateScreen = '/topRateScreen';

  // TV Screens ........
  static const String tvScreen = '/tvScreen';
  static const String tvTopRatedScreen = '/tvTopRatedScreen';
  static const String tvPopularScreen = '/tvPopularScreen';
}
