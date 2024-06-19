import 'package:injectable/injectable.dart';
import 'package:movie_series_app/feature/movie/domain/entities/movie.dart';
import 'package:movie_series_app/feature/movie/domain/repositories/movie_repository.dart';

@Injectable()
class GetMovies {
  final MovieRepository repository;

  GetMovies({required this.repository});

  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}
