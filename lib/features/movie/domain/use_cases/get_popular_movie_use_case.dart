import 'package:clean_arc/core/errors/failures.dart';
import 'package:clean_arc/features/movie/domain/entities/movies_entities.dart';
import 'package:clean_arc/features/movie/domain/repositories/movie_repo.dart';
import 'package:dartz/dartz.dart';

class GetPopularMovieUseCase {
  final MovieRepo movieRepo;
  GetPopularMovieUseCase(this.movieRepo);
  Future<Either<Failure, List<MovieEntities>>> call() async {
    return await movieRepo.getPopularMovies();
  }
}
