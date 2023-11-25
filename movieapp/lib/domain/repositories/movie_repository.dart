import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/movie_detail.dart';
import 'package:movieapp/domain/entities/movie_trailer.dart';

import '../../data/failure.dart';
import '../entities/movie.dart';

abstract class MovieRepository {

  Future<Either<Failure,List<Movie>>> getUpcomingMovies();
  Future<Either<Failure,MovieDetail>> getMovieDetail(String movieId);
  Future<Either<Failure,List<Movie>>> searchMovies(String keyword);
  Future<Either<Failure,List<MovieTrailer>>> getMovieTraler(String keyword);
}