
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entities/movie_detail.dart';

import '../../domain/entities/movie.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailModel extends Equatable{
 const  MovieDetailModel({ required this.release_date,required this.overview,required this.id,required this.poster_path, required this.title});





  @override
  List<Object?> get props => [id,release_date,overview,poster_path,title];

  final String title;
  final String poster_path;
  final int id;
  final String release_date;
  final String overview;

 

    factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  
  MovieDetail toEntity(){
    return MovieDetail(id: id,poster: poster_path,title: title,releaseDate: release_date);
  }




}
