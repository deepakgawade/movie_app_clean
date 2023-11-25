import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {

  final String title;
  final int id;
  final String poster;
  final String releaseDate;


 const  MovieDetail({required this.title, required this.id, required this.poster ,required this.releaseDate});




  @override
  List<Object?> get props => [title,id,poster];

}
