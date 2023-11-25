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
  List<Object?> get props => [];

  // final MovieModelList name;
  // final Map<String, dynamic> currencies;
  // final List<String> capital;
  final String title;
  final String poster_path;
  
  final int id;

  // final Flags flags; 
  // final Capital capitalInfo;

    factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  
  Movie toEntity(){
    return Movie(id: id,poster: poster_path,title: title);
  }




}
// @JsonSerializable()
// class MovieModelList extends Equatable{

//   final String common;
//   final String official;

//       factory MovieModelList.fromJson(Map<String, dynamic> json) =>
//       _$MovieModelListFromJson(json);

//   const MovieModelList({required this.common, required this.official});
 

//   @override
//   List<Object?> get props => [common, official];

// }
// @JsonSerializable()
// class Maps extends Equatable{

//   final String googleMaps;
 

//       factory Maps.fromJson(Map<String, dynamic> json) =>
//       _$MapsFromJson(json);

//   const Maps({required this.googleMaps,});


//   @override
//   List<Object?> get props => [googleMaps,];

// }
// @JsonSerializable()
// class Flags extends Equatable{

//   final String png;
 

//       factory Flags.fromJson(Map<String, dynamic> json) =>
//       _$FlagsFromJson(json);

//   const Flags({required this.png,});
 

//   @override
//   List<Object?> get props => [png,];

// }
// @JsonSerializable()
// class Capital extends Equatable{

//   final List<double> latlng;
 

//       factory Capital.fromJson(Map<String, dynamic> json) =>
//       _$CapitalFromJson(json);

//   const Capital({required this.latlng,});
 

//   @override
//   List<Object?> get props => [latlng,];

// }