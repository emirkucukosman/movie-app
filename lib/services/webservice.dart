import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:movie_app/models/movie.dart';

class WebService {
  final http.Client httpClient;

  const WebService({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=fa35f0dd";
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception("Error fetching movies");
    }

    final body = jsonDecode(response.body);
    final Iterable json = body["Search"];
    return json.map((movie) => Movie.fromJson(movie)).toList();
  }
}
