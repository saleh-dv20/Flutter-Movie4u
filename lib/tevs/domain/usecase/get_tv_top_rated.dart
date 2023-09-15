import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/repository/base_tv_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvTopRatedUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvTopRatedUseCase(this.baseTvRepository);

  Future<Either<Failure,List<TvEntitie>>> exeuse()async{
    return await baseTvRepository.getTopRated();
  }
}
