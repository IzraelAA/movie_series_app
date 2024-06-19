import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  Movie({
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [title, posterPath, releaseDate, voteAverage];
}
