import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_series_app/feature/movie/domain/entities/movie.dart';
import 'package:movie_series_app/feature/movie/domain/use_cases/get_movie.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_event.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_state.dart';

@Injectable()
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovies getMovies;
  List<Movie> allMovies = [];

  MovieBloc({required this.getMovies}) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await getMovies();
        allMovies = movies;
        emit(MovieLoaded(movies: movies));
      } catch (e) {
        emit(MovieError(message: e.toString()));
      }
    });
    on<FilterMoviesByCategory>(_onFilterMoviesByCategory);
  }
  void _onFilterMoviesByCategory(FilterMoviesByCategory event, Emitter<MovieState> emit) {
    if (event.category.name == 'All') {
      emit(MovieLoaded(movies: allMovies));
    } else {
      final filteredMovies = allMovies.where((movie) {
        return movie.voteAverage >= event.category.rateValue;
      }).toList();
      emit(MovieLoaded(movies: filteredMovies));
    }
  }

}
