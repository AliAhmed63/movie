import 'package:clean_arc/core/errors/failures.dart';
import 'package:clean_arc/features/movie/data/data_sources/movie_data_source.dart';
import 'package:clean_arc/features/movie/domain/entities/movie_details.dart';
import 'package:clean_arc/features/movie/domain/entities/movies_entities.dart';
import 'package:clean_arc/features/movie/domain/entities/recommendation.dart';
import 'package:clean_arc/features/movie/domain/repositories/movie_repo.dart';
import 'package:dartz/dartz.dart';

class MovieRepoImp extends MovieRepo {
  final BaseMovieDataSource baseMovieDataSource;
  MovieRepoImp(this.baseMovieDataSource);

  @override
  Future<Either<Failure, List<MovieEntities>>> getNOwPlayingMovies() async {
    final result = await baseMovieDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntities>>> getPopularMovies() async {
    final result = await baseMovieDataSource.getPopularMovies();
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntities>>> getTopRatedMovies() async {
    final result = await baseMovieDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntities>> getMoviesDetails(
      int movieId) async {
    final result = await baseMovieDataSource.getMoviesDetails(movieId);
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntities>>> getSimilarMovies(
      int movieId) async {
    final result = await baseMovieDataSource.getSimilarMovies(movieId);
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
