import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';
import 'package:dartz/dartz.dart';

import '../repository/base_tv_repository.dart';

class GetTvPopularUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvPopularUseCase(this.baseTvRepository);
  Future<Either<Failure,List<TvEntitie>>> execues() async {
    return await baseTvRepository.getPopular();
  }
}
