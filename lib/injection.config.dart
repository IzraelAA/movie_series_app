// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'feature/movie/data/data_sources/movie_remote_data_source.dart' as _i3;
import 'feature/movie/data/repositories/movie_repository.dart' as _i5;
import 'feature/movie/domain/repositories/movie_repository.dart' as _i4;
import 'feature/movie/domain/use_cases/get_movie.dart' as _i6;
import 'feature/movie/presentation/manager/movie_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.MovieRemoteDataSource>(
      () => _i3.MovieRemoteDataSource());
  gh.lazySingleton<_i4.MovieRepository>(() => _i5.MovieRepositoryImpl(
      remoteDataSource: get<_i3.MovieRemoteDataSource>()));
  gh.factory<_i6.GetMovies>(
      () => _i6.GetMovies(repository: get<_i4.MovieRepository>()));
  gh.factory<_i7.MovieBloc>(
      () => _i7.MovieBloc(getMovies: get<_i6.GetMovies>()));
  return get;
}
