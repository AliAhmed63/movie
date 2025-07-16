import 'package:clean_arc/core/errors/failures.dart';
import 'package:clean_arc/features/movie/domain/entities/movies_entities.dart';
import 'package:clean_arc/features/movie/domain/repositories/movie_repo.dart';
import 'package:dartz/dartz.dart';

//هنا بنعمل رسم مجرد للجلب الدات من الباك اند 
//يعني احنا هنا بنرسم بس كدا عشان نقدر نفهم ونصين بسهولة يبعد كدا بنعمل دالة اسمها كول
// الكول دي وضيفتها انها بتستدعي الدالة الي مربوط بالفايل دا في الجزء الخاص بالريبو
// وهنا طبعا بنعتمد اعتماد كلي علي انتيتي نفسها مش علي المودل
class GetNowPlayingMovieUseCase {
  final MovieRepo movieRepo;
  GetNowPlayingMovieUseCase(this.movieRepo);

  Future<Either<Failure, List<MovieEntities>>> call() async {
    return await movieRepo.getNOwPlayingMovies();
  }
}
