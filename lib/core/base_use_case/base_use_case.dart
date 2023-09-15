import 'package:cima_movies_clean/core/erorr/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseMovieUseCase<T , Prammetrs> {
  Future<Either<Failure, T>> call(Prammetrs prammetrs);
}

class NoPrammetrs extends Equatable {
 const NoPrammetrs();
  
  @override
  List<Object?> get props => [];
}

// Tv 

// abstract class BaseTvUseCase<>()