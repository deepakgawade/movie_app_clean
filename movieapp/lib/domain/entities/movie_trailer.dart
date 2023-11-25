import 'package:equatable/equatable.dart';

class MovieTrailer extends Equatable {

  final String key;
  final String id;
  final String type;


 const  MovieTrailer({required this.key, required this.id, required this.type });




  @override
  List<Object?> get props => [key,id,type];
}