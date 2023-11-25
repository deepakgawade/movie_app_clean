part of 'movie_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}
//events for movielist
class MoviesResetEvent extends MoviesEvent{
  

}
class MoviesUpcomingEvent extends MoviesEvent{
  

}



//movie detail events
class MovieDetailEvent extends MoviesEvent{
  final String movieId;

 const MovieDetailEvent({required this.movieId});

}
class MovieDetailResetEvent extends MoviesEvent{
 



}

// are movie search events
class MovieSearchEvent extends MoviesEvent{
  final String keyword;

 const MovieSearchEvent({required this.keyword});

}
class MovieSearchResetEvent extends MoviesEvent{
 



}