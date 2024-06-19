import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../models/movie_model.dart';

@LazySingleton()
class MovieRemoteDataSource {
  static const String apiKey = 'b031ecd04177e1c9aae4efcb44b3f301';
  static const String apiUrl = 'https://api.themoviedb.org/3/discover/movie';

  Future<List<MovieModel>> fetchMovies() async {
    final response = await http.get(Uri.parse(
        '$apiUrl?api_key=$apiKey&include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return (data['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
