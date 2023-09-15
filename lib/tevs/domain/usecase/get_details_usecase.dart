import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:cima_movies_clean/tevs/domain/entities/details_entiti.dart';
import 'package:dartz/dartz.dart';

import '../repository/base_tv_repository.dart';

class GetDetailsUseCase {
  final BaseTvRepository baseTvRepository;
  GetDetailsUseCase({required this.baseTvRepository});

  // execues method
  Future<Either<Failure, DetailsEntiti>> execues(int tvId , [int? seasonNumber]) async {
    return await baseTvRepository.getDetails(tvId );
  }
}
