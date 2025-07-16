import 'dart:developer';

import 'package:clean_arc/core/errors/exception.dart';
import 'package:clean_arc/core/helper/api_services.dart';
import 'package:clean_arc/core/utils/const.dart';
import 'package:clean_arc/features/movie/data/models/movie_details_model.dart';
import 'package:clean_arc/features/movie/data/models/movie_model.dart';
import 'package:clean_arc/features/movie/data/models/recommendation_model.dart';

abstract class BaseMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMoviesDetails(int movieId);

  Future<List<RecommendationModel>> getSimilarMovies(int movieId);
}

//هنا بنعمل كول اساس لل api
//الجزء بقا الخاص بالديو والجيت والبوست وكل الكلام دا عشان كدا بقا بنحقن الديو هنا
//وادام كول api يبقا هنعتم\ علي المودل مش الانتيتي
//
class MovieDataSource implements BaseMovieDataSource {
  DioHelper dioHelper;
  MovieDataSource(
    this.dioHelper,
  );
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await dioHelper.getData(
      url: 'movie/now_playing?api_key=${BackendEndPoints.apiKey}',
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dioHelper.getData(
      url: 'movie/popular?api_key=${BackendEndPoints.apiKey}',
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await dioHelper.getData(
      url: 'movie/top_rated?api_key=${BackendEndPoints.apiKey}',
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(int movieId) async {
    final response = await dioHelper.getData(
      url: 'movie/$movieId?api_key=${BackendEndPoints.apiKey}',
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getSimilarMovies(int movieId) async {
    final response = await dioHelper.getData(
      url: 'movie/$movieId/similar?api_key=${BackendEndPoints.apiKey}',
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
