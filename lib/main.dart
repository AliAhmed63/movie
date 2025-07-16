import 'package:bloc/bloc.dart';
import 'package:clean_arc/core/helper/custom_bloc_observer.dart';
import 'package:clean_arc/core/helper/injection_container.dart';
import 'package:clean_arc/core/recourses/color_manager/color_manager.dart';
import 'package:clean_arc/features/movie/presentation/pages/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  //bloc observer
  Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  //screenUtil init
  await ScreenUtil.ensureScreenSize();
  // initGetIt();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: MyColors.grayscale700,
        ),
        home: MoviesScreen(),
      ),
    );
  }
}
