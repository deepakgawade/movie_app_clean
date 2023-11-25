import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/movie_trailer.dart';
import '../../data/failure.dart';
import '../repositories/movie_repository.dart';

class GetMovieTrailer{
  final MovieRepository movieRepository;

  GetMovieTrailer({required this.movieRepository});


  Future<Either<Failure,List<MovieTrailer>>> execute(String movieId){
    return movieRepository.getMovieTraler(movieId);
  }


}