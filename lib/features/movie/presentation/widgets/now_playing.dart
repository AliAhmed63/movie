import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_arc/core/recourses/color_manager/color_manager.dart';
import 'package:clean_arc/core/recourses/styles_manger/styles_manager.dart';
import 'package:clean_arc/core/utils/const.dart';
import 'package:clean_arc/core/utils/enums.dart';
import 'package:clean_arc/features/movie/presentation/bloc/movie/movies_bloc.dart';
import 'package:clean_arc/features/movie/presentation/pages/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (prev, cur) => prev.nowPlayingState != cur.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return SizedBox(
              height: 400.h,
              width: double.infinity,
              child: Center(
                  child: CircularProgressIndicator(
                color: MyColors.black,
              )),
            );

          case RequestState.success:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMoviesList.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailScreen(id: item.id),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0,
                              imageUrl:
                                  BackendEndPoints.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        'Now Playing'.toUpperCase(),
                                        style: getBoldStyle(
                                            fontSize: 16.sp,
                                            color: MyColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: getRegularStyle(
                                      fontSize: 24.sp,
                                      color: MyColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.error:
            return Center(child: Text('state.nowPlayingMoviesMessage'));
        }
      },
    );
  }
}
