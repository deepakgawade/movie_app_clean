import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie_trailer.dart';

part 'movie_trailer_model.g.dart';

@JsonSerializable()
class MovieTrailers extends Equatable {
  final List<MovieTarilerModel> results;

  factory MovieTrailers.fromJson(Map<String, dynamic> json) =>
      _$MovieTrailersFromJson(json);

  const MovieTrailers({required this.results});

   List<MovieTrailer> toEntity() {
    List<MovieTrailer> movietrailers=[];
    for (int i = 0; i < results.length; i++) {
      if (results[i].type == "Trailer") {
        movietrailers.add(results[i].toEntity());
      }
    }
    return movietrailers;
  }

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class MovieTarilerModel extends Equatable {
  const MovieTarilerModel(
      {required this.id, required this.key, required this.type});

  @override
  List<Object?> get props => [id, key, type];

  final String type;
  final String? key;

  final String id;

  factory MovieTarilerModel.fromJson(Map<String, dynamic> json) =>
      _$MovieTarilerModelFromJson(json);

  MovieTrailer toEntity() {
    return MovieTrailer(id: id, key: key ?? "", type: type);
  }
}
