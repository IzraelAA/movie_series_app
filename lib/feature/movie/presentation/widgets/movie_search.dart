import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_bloc.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_state.dart';
import 'package:movie_series_app/feature/movie/presentation/widgets/movie_list_item.dart';

class MovieSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoaded) {
          final results = state.movies.where((movie) => movie.title.toLowerCase().contains(query.toLowerCase())).toList();

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return MovieListItem(movie: results[index]);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
