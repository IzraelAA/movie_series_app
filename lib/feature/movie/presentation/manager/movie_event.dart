import 'package:equatable/equatable.dart';
import 'package:movie_series_app/feature/movie/presentation/pages/movie_list_page.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMovies extends MovieEvent {}
class FilterMoviesByCategory extends MovieEvent {
  final Category category;

  FilterMoviesByCategory(this.category);

  @override
  List<Object> get props => [category];
}
