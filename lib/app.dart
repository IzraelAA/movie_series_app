import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_bloc.dart';
import 'package:movie_series_app/feature/movie/presentation/manager/movie_event.dart';
import 'package:movie_series_app/feature/movie/presentation/pages/movie_list_page.dart';
import 'injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (context) => getIt<MovieBloc>()..add(FetchMovies()),
        ),
      ],
      child: MaterialApp(
        title: 'Movie Series App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  MovieListPage(),
      ),
    );
  }
}
