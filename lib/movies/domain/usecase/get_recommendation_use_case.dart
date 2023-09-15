import 'package:cima_movies_clean/core/base_use_case/base_use_case.dart';
import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/movies/domain/entities/recommendation.dart';
import 'package:cima_movies_clean/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationUseCase extends BaseMovieUseCase<
    List<RecommendationEntitie>, RecommndationPrammetrs> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<RecommendationEntitie>>> call(
      RecommndationPrammetrs prammetrs) async {
    return await baseMovieRepository.getRecommendation(prammetrs);
  }
}

class RecommndationPrammetrs extends Equatable {
  final int id;


  const RecommndationPrammetrs({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
