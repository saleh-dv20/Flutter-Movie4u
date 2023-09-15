import 'package:cima_movies_clean/movies/data/datasource/remote_movie_data_source.dart';
import 'package:cima_movies_clean/movies/data/repository/movie_repository.dart';
import 'package:cima_movies_clean/movies/domain/repository/base_movies_repository.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_now_playing_usecases.dart';
import 'package:cima_movies_clean/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:cima_movies_clean/tevs/data/datasource/base_remote_data_source.dart';
import 'package:cima_movies_clean/tevs/data/repository/tv_repositroy.dart';
import 'package:cima_movies_clean/tevs/domain/repository/base_tv_repository.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_details_usecase.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_episodes_usecase.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_on_the_air_usecase.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_tv_recommendations_usecase.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_tv_top_rated.dart';
import 'package:cima_movies_clean/tevs/domain/usecase/get_tvpoplar.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/details_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/popular_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/top_rated_tv_controller.dart';
import 'package:cima_movies_clean/tevs/presntation/controller/tv_controller.dart';
import 'package:get_it/get_it.dart';

import '../../movies/domain/usecase/get_details_movie.dart';
import '../../movies/domain/usecase/get_popular_usecases.dart';
import '../../movies/domain/usecase/get_top_rated_usecases.dart';
import '../../movies/presntation/controller/details_controller.dart';
import '../../movies/presntation/controller/now_playing_controller.dart';
import '../../movies/presntation/controller/top_rated_controller.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // Controllers
    sl.registerLazySingleton(() => NowPlayingController(sl()));
    sl.registerLazySingleton(() => DetailsController(sl(), sl()));
    sl.registerLazySingleton(() => TopRatedController(sl()));

    // Use Case
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetDetailsMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    // Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    // sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    // DATA SOURCE
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSource());

    // TV SERVECES....................

    // Controllers......
    sl.registerLazySingleton(() => TvController(sl()));
    sl.registerLazySingleton(() => PopularTvController(sl()));
    sl.registerLazySingleton(() => TopRatedTvController(sl()));
    sl.registerLazySingleton(() => DetailsTvController(sl(), sl(), sl()));

    // Use Case ........
    sl.registerLazySingleton(() => GetOnTheAirUseCase(sl()));
    sl.registerLazySingleton(() => GetTvPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTvTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetDetailsUseCase(baseTvRepository: sl()));
    sl.registerLazySingleton(() => GetTvRecommendationsUseCase(sl()));
    sl.registerLazySingleton(
      () => GetEpisodesUseCase(sl()),
    );

    // Repository.......
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));
    // Data Source.......
    sl.registerLazySingleton<BseTvRemoteDataSource>(() => RemoteTvDataSource());
  }
}
