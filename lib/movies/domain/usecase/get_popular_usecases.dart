import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../repository/base_movies_repository.dart';

class GetPopularUseCase extends BaseMovieUseCase<List<MovieEntitie> , NoPrammetrs>{
  final BaseMovieRepository baseMoviesRepository;

  GetPopularUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<MovieEntitie>>> call(NoPrammetrs prammetrs) async {
    return await baseMoviesRepository.getPopuler();
  }
}
