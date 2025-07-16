import 'package:clean_arc/core/errors/failures.dart';
import 'package:clean_arc/features/movie/domain/entities/movies_entities.dart';
import 'package:clean_arc/features/movie/domain/repositories/movie_repo.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedUseCase {
  final MovieRepo movieRepo;
  GetTopRatedUseCase(this.movieRepo);
   Future<Either<Failure, List<MovieEntities>>> call() async {
    return await movieRepo.getTopRatedMovies();
  }
}
