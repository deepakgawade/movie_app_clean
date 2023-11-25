
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/domain/entities/movie_detail.dart';

import '../../domain/entities/movie.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class GenerModel extends Equatable{

  final int id;
  final String name;


      factory GenerModel.fromJson(Map<String, dynamic> json) =>
      _$GenerModelFromJson(json);

  const GenerModel({required this.id,required this.name});

//  List<Movie> toEntityList(){
//   List<Movie> movieList=[];
// for (int i=0; i<results.length;i++){
//   var movie=results[i].toEntity();
//   movieList.add(movie);

// }
//     return movieList;
//   }
 

  @override
  List<Object?> get props => [id,name];

}
@JsonSerializable()
class MovieDetailModel extends Equatable{
   MovieDetailModel({ required this.genres,required this.release_date,required this.overview,required this.id,required this.poster_path, required this.title});





  @override
  List<Object?> get props => [id,release_date,overview,poster_path,title,genres];

  final String title;
  final String poster_path;
  final int id;
  final String release_date;
  final String overview;
  List<GenerModel> genres;

 

    factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  
  MovieDetail toEntity(){
    List<String> generslist=[];
    for(int i = 0; i<genres.length;i++){
      generslist.add(genres[i].name);
    }
    
    return MovieDetail(id: id,poster: poster_path,title: title,releaseDate: release_date,genres: generslist,overview: overview);
  }




}
