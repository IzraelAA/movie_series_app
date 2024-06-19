
import 'package:movie_series_app/feature/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.title,
    required super.posterPath,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
    };
  }
}
