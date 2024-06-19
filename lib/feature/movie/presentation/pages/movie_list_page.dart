import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_bloc.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_event.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_state.dart';
import 'package:movie_series_app/feature/movie/presentation/widgets/category_filter.dart';
import 'package:movie_series_app/feature/movie/presentation/widgets/movie_list_item.dart';
import 'package:movie_series_app/feature/movie/presentation/widgets/movie_search.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => MovieListPageState();
}

class MovieListPageState extends State<MovieListPage> {
  List<Category> categories = [
    Category(name: 'All', rateValue: 2, activeState: false),
    Category(name: 'Bad', rateValue: 4, activeState: false),
    Category(name: 'Good', rateValue: 6, activeState: false),
    Category(name: 'Great', rateValue: 8, activeState: false),
    Category(name: 'Recommend', rateValue: 9, activeState: false),
  ];

  void _filterMovies(Category category) {
    BlocProvider.of<MovieBloc>(context).add(FilterMoviesByCategory(category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie/Series List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MovieSearch());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CategoryFilter(
            categories: categories,
            onCategorySelected: _filterMovies,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieError) {
                  return Center(child: Text(state.message));
                } else if (state is MovieLoaded) {
                  return ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return MovieListItem(movie: state.movies[index]);
                    },
                  );
                } else {
                  return const Center(child: Text('No movies found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final double rateValue;
  bool activeState;

  Category({
    required this.name,
    required this.rateValue,
    this.activeState = false,
  });
}
