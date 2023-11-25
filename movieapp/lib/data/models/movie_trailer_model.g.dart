// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_trailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieTrailers _$MovieTrailersFromJson(Map<String, dynamic> json) =>
    MovieTrailers(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieTarilerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieTrailersToJson(MovieTrailers instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MovieTarilerModel _$MovieTarilerModelFromJson(Map<String, dynamic> json) =>
    MovieTarilerModel(
      id: json['id'] as String,
      key: json['key'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$MovieTarilerModelToJson(MovieTarilerModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'id': instance.id,
    };
