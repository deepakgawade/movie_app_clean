import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {

  final String title;
  final int id;
  final String poster;
  final String releaseDate;
  final String overview;
  final List<String> genres;


 const  MovieDetail( {required this.title, required this.id, required this.poster ,required this.releaseDate,required this.genres,required this.overview});




  @override
  List<Object?> get props => [title,id,poster];

}
