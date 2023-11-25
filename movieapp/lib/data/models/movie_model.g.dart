// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModelList _$MovieModelListFromJson(Map<String, dynamic> json) =>
    MovieModelList(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieModelListToJson(MovieModelList instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'] as int,
      poster_path: json['poster_path'] as String?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.poster_path,
      'id': instance.id,
    };
