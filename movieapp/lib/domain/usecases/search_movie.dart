import 'package:dartz/dartz.dart';
import '../../data/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class SearchMovie{
  final MovieRepository movieRepository;

 SearchMovie({required this.movieRepository});


  Future<Either<Failure,List<Movie>>> execute(String keyword){
    return movieRepository.searchMovies(keyword);
  }


}