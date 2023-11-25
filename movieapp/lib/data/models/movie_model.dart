import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';


@JsonSerializable()
class MovieModelList extends Equatable{

  final List<MovieModel> results;


      factory MovieModelList.fromJson(Map<String, dynamic> json) =>
      _$MovieModelListFromJson(json);

  const MovieModelList({required this.results});

 List<Movie> toEntityList(){
  List<Movie> movieList=[];
for (int i=0; i<results.length;i++){
  var movie=results[i].toEntity();
  movieList.add(movie);

}
    return movieList;
  }
 

  @override
  List<Object?> get props => [];

}
@JsonSerializable()
class MovieModel extends Equatable{
 const  MovieModel({required this.id,required this.poster_path, required this.title});





  @override
  List<Object?> get props => [id, poster_path,title];

  // final MovieModelList name;
  // final Map<String, dynamic> currencies;
  // final List<String> capital;
  final String title;
  final String? poster_path;
  
  final int id;

  // final Flags flags; 
  // final Capital capitalInfo;

    factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  
  Movie toEntity(){
    return Movie(id: id,poster: poster_path??"",title: title);
  }




}


