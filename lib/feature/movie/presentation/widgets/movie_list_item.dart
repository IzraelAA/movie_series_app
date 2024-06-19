import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  MovieListItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network('https://image.tmdb.org/t/p/w200${movie.posterPath}'),
      title: Text(movie.title),
      subtitle: Text('Release Date: ${movie.releaseDate}'),
    );
  }
}
