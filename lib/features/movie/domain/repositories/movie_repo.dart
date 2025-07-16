import 'package:clean_arc/core/errors/failures.dart';
import 'package:clean_arc/features/movie/domain/entities/movie_details.dart';
import 'package:clean_arc/features/movie/domain/entities/movies_entities.dart';
import 'package:clean_arc/features/movie/domain/entities/recommendation.dart';
import 'package:dartz/dartz.dart';

//هنا بنعمل كلاس للرييبو نفسها نرسم فيها الاستركتشر من غير ما ندخل في تفاصيل
//بنعتمد برضو اعتماد كلي علي الانتيتي هنا
//
//

abstract class MovieRepo {
  Future<Either<Failure, List<MovieEntities>>> getNOwPlayingMovies();
  Future<Either<Failure, List<MovieEntities>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntities>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsEntities>> getMoviesDetails(int movieId);
  Future<Either<Failure, List<RecommendationEntities>>> getSimilarMovies(
      int movieId);
}
