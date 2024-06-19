import 'package:injectable/injectable.dart';
import 'package:movie_series_app/feature/movie/domain/entities/movie.dart';
import 'package:movie_series_app/feature/movie/domain/repositories/movie_repository.dart';

import '../data_sources/movie_remote_data_source.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getMovies() async {
    final movieModels = await remoteDataSource.fetchMovies();
    return movieModels;
  }
}
