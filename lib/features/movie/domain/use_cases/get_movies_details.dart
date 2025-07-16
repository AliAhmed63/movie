import 'package:clean_arc/core/errors/failures.dart';
import 'package:clean_arc/features/movie/domain/entities/movie_details.dart';
import 'package:dartz/dartz.dart';

import '../repositories/movie_repo.dart';

class GetMoviesDetailsUseCase {
  final MovieRepo movieRepo;

  GetMoviesDetailsUseCase( this.movieRepo);

  Future<Either<Failure, MovieDetailsEntities>> call(int movieId) async {
    return await movieRepo.getMoviesDetails(movieId);
  }
}
