import 'package:cima_movies_clean/core/base_use_case/base_use_case.dart';
import 'package:cima_movies_clean/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/erorr/failure.dart';
import '../entities/movie.dart';

class GetTopRatedUseCase extends BaseMovieUseCase<List<MovieEntitie> , NoPrammetrs>{
  final BaseMovieRepository baseMoviesRepository;

  GetTopRatedUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntitie>>> call(NoPrammetrs prammetrs) async {
    return await baseMoviesRepository.getTopRated();
  }
}
