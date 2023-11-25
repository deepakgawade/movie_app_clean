// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
    MovieDetailModel(
      release_date: json['release_date'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      poster_path: json['poster_path'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$MovieDetailModelToJson(MovieDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.poster_path,
      'id': instance.id,
      'release_date': instance.release_date,
      'overview': instance.overview,
    };
