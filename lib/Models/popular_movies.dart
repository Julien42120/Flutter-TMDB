import 'package:json_annotation/json_annotation.dart';
part 'popular_movies.g.dart';

@JsonSerializable()
class PopularMovies {
  int id;
  String title;
  String overview;
  String poster_path;
  DateTime release_date;
  double vote_average;

  PopularMovies({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
  });

  factory PopularMovies.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesToJson(this);

  static fromMap(Map<String, Object?> result) {}
}
