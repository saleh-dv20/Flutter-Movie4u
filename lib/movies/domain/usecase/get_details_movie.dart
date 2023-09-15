import 'package:cima_movies_clean/core/base_use_case/base_use_case.dart';
import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/movies/domain/entities/details.dart';
import 'package:cima_movies_clean/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class GetDetailsMovieUseCase extends BaseMovieUseCase<DetailsMovieEntitie , DetailsPrammetrs>{
  final BaseMovieRepository baseMovieRepository;

  GetDetailsMovieUseCase(this.baseMovieRepository);
  
  @override
  Future<Either<Failure, DetailsMovieEntitie>> call(DetailsPrammetrs prammetrs) async {
       return await baseMovieRepository.getDetails(prammetrs);

  }

  
}
class DetailsPrammetrs extends Equatable {
  final int detailsId;

  const DetailsPrammetrs({required this.detailsId});

  @override
  List<Object?> get props => [detailsId];
}
