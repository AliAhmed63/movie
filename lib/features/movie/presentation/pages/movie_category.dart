import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arc/core/helper/injection_container.dart';
import 'package:clean_arc/core/utils/const.dart';
import 'package:clean_arc/core/utils/enums.dart';
import 'package:clean_arc/features/movie/presentation/bloc/movie/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movies_entities.dart';

class MovieCategoryScreen extends StatelessWidget {
  final String title;
  final MovieCategoryType category;

  const MovieCategoryScreen({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = sl<MoviesBloc>();
        switch (category) {
          case MovieCategoryType.nowPlaying:
            bloc.add(GetNowPlayingMoviesEvent());
            break;
          case MovieCategoryType.popular:
            bloc.add(GetPopularMoviesEvent());
            break;
          case MovieCategoryType.topRated:
            bloc.add(GetTopRatedMoviesEvent());
            break;
        }
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            final list = _getList(state);
            final loading = _getLoadingState(state);
            final message = _getMessage(state);

            if (loading == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (loading == RequestState.error) {
              return Center(child: Text(message));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.6,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final movie = list[index];

                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      // صورة الفيلم
                      CachedNetworkImage(
                        imageUrl: BackendEndPoints.imageUrl(movie.backdropPath),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),

                      // التدرج الأسود من الأسفل
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 80, // حوالي تلت الصورة
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      // النصوص: الاسم، التاريخ، والمدة
                      Positioned(
                        bottom: 8,
                        left: 8,
                        right: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _formatDuration(movie.voteAverage.toInt()),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _extractYear(movie.releaseDate),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<MovieEntities> _getList(MoviesState state) {
    switch (category) {
      case MovieCategoryType.nowPlaying:
        return state.nowPlayingMoviesList;
      case MovieCategoryType.popular:
        return state.popularMoviesList;
      case MovieCategoryType.topRated:
        return state.topRatedMoviesList;
    }
  }

  RequestState _getLoadingState(MoviesState state) {
    switch (category) {
      case MovieCategoryType.nowPlaying:
        return state.nowPlayingState;
      case MovieCategoryType.popular:
        return state.popularMoviesState;
      case MovieCategoryType.topRated:
        return state.topRatedMoviesState;
    }
  }

  String _getMessage(MoviesState state) {
    switch (category) {
      case MovieCategoryType.nowPlaying:
        return state.nowPlayingMoviesMessage;
      case MovieCategoryType.popular:
        return state.popularMoviesMessage;
      case MovieCategoryType.topRated:
        return state.topRatedMoviesMessage;
    }
  }
}

String _formatDuration(int? runtime) {
  if (runtime == null || runtime == 0) return 'Unknown';
  final hours = runtime ~/ 60;
  final minutes = runtime % 60;
  return hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m';
}

String _extractYear(String date) {
  if (date.isEmpty || !date.contains('-')) return 'N/A';
  return date.split('-').first;
}
