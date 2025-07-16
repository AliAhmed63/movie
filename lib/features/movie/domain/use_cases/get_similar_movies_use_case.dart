import 'package:clean_arc/core/errors/failures.dart';
import 'package:clean_arc/features/movie/domain/entities/recommendation.dart';
import 'package:clean_arc/features/movie/domain/repositories/movie_repo.dart';
import 'package:dartz/dartz.dart';

class GetSimilarMoviesUseCase {
  final MovieRepo movieRepo;
  GetSimilarMoviesUseCase(this.movieRepo);
  Future<Either<Failure, List<RecommendationEntities>>> call(
      int movieId) async {
    return await movieRepo.getSimilarMovies(movieId);
  }
}
