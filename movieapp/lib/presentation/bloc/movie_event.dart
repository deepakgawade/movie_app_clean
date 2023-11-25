part of 'movie_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class MoviesResetEvent extends MoviesEvent{
  

}
class MoviesUpcomingEvent extends MoviesEvent{
  

}
class MoviesSearchEvent extends MoviesEvent{
  final String country;

 const MoviesSearchEvent({required this.country});
}
