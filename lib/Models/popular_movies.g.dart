// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovies _$PopularMoviesFromJson(Map<String, dynamic> json) =>
    PopularMovies(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      poster_path: json['poster_path'] as String,
      release_date: DateTime.parse(json['release_date'] as String),
      vote_average: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$PopularMoviesToJson(PopularMovies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date.toIso8601String(),
      'vote_average': instance.vote_average,
    };
