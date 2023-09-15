import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/tevs/domain/entities/episode_entitie.dart';
import 'package:cima_movies_clean/tevs/domain/repository/base_tv_repository.dart';
import 'package:dartz/dartz.dart';

class GetEpisodesUseCase {
  final BaseTvRepository baseTvRepository;

  GetEpisodesUseCase(this.baseTvRepository);

  Future<Either<Failure, List<EpisodesEntitie>>> execuse(
      int tvId, int seasonNamder) async {
    return await baseTvRepository.getEpisodes(tvId, seasonNamder);
  }
}
