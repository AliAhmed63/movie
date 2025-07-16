import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc/core/utils/enums.dart';
import 'package:clean_arc/features/movie/domain/entities/movies_entities.dart';
import 'package:clean_arc/features/movie/domain/use_cases/get_now_playing_movie_use_case.dart';
import 'package:clean_arc/features/movie/domain/use_cases/get_popular_movie_use_case.dart';
import 'package:clean_arc/features/movie/domain/use_cases/get_top_rated_use_case.dart';
import 'package:equatable/equatable.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;

  MoviesBloc(
    this.getNowPlayingMovieUseCase,
    this.getPopularMovieUseCase,
    this.getTopRatedUseCase,
  ) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMoviesEvent);

    on<GetPopularMoviesEvent>(_getPopularMoviesEvent);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent);
  }
  FutureOr<void> _getNowPlayingMoviesEvent(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(
        state.copyWith(nowPlayingState: RequestState.loading)); // إظهار التحميل

    final result = await getNowPlayingMovieUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMoviesMessage: failure.message,
        ));
      },
      (movies) {
        emit(state.copyWith(
          nowPlayingState: RequestState.success,
          nowPlayingMoviesList: movies,
        ));
      },
    );
  }

  FutureOr<void> _getPopularMoviesEvent(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(
        popularMoviesState: RequestState.loading)); // إظهار التحميل

    final result = await getPopularMovieUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(
          popularMoviesState: RequestState.error,
          popularMoviesMessage: failure.message,
        ));
      },
      (movies) {
        emit(state.copyWith(
          popularMoviesState: RequestState.success,
          popularMoviesList: movies,
        ));
      },
    );
  }

  FutureOr<void> _getTopRatedMoviesEvent(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(
        topRatedMoviesState: RequestState.loading)); // إظهار التحميل

    final result = await getTopRatedUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(
          topRatedMoviesState: RequestState.error,
          topRatedMoviesMessage: failure.message,
        ));
      },
      (movies) {
        emit(state.copyWith(
          topRatedMoviesState: RequestState.success,
          topRatedMoviesList: movies,
        ));
      },
    );
  }
}
