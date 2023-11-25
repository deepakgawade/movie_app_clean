import 'package:dartz/dartz.dart';
import '../../data/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieList{
  final MovieRepository movieRepository;

  GetMovieList({required this.movieRepository});


  Future<Either<Failure,List<Movie>>> execute(){
    return movieRepository.getUpcomingMovies();
  }


}