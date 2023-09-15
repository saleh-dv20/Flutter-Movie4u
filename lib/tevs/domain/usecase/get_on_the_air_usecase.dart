import 'package:cima_movies_clean/tevs/domain/entities/tv_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/repository/base_tv_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/erorr/failure.dart';

class GetOnTheAirUseCase {
  final BaseTvRepository baseTvRepository;

  GetOnTheAirUseCase(this.baseTvRepository);

  Future<Either<Failure,List<TvEntitie>>> execues() async {
    return await baseTvRepository.getOnTheAair();
  }
}
