import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String poster;

  Movie({this.title, this.poster});

  @override
  List<Object> get props => [title, poster];

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(title: json["Title"], poster: json["Poster"]);
  }
}
