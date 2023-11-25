import 'package:equatable/equatable.dart';

class Movie extends Equatable {

  final String title;
  final int id;
  final String poster;


 const  Movie({required this.title, required this.id, required this.poster });




  @override
  List<Object?> get props => [title,id,poster];
}
