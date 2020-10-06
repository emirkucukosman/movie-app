import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/webservice.dart';

class MovieListViewModel extends ChangeNotifier {
  final WebService webService;
  List<MovieViewModel> movies = List<MovieViewModel>();

  MovieListViewModel({@required this.webService}) : assert(webService != null);

  Future<void> fetchMovies(String keyword) async {
    final results = await webService.fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}

class MovieViewModel {
  final Movie movie;

  const MovieViewModel({this.movie});

  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.poster;
  }
}
