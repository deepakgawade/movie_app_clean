import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/utils/get_image_url.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final countyController = TextEditingController();
  @override
  void dispose() {
    countyController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesBloc = BlocProvider.of<MoviesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Weather"),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        bloc: moviesBloc,
        builder: (context, state) {
          if (state is MoviesInitialState) {
            moviesBloc.add(MoviesUpcomingEvent());
            return const Padding(padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("Getting Movies...loading"),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     countryBloc.add(CountrySearchEvent(country: countyController.text));
                  //   },
                  //   child: const Text("Submit"),
                  // )
                ],
              ),
            );
          } else if (state is MoviesLoadingState) {
            return const Center(child:  CircularProgressIndicator());
          } else if (state is MoviesLoadedState) {
            return Center(
              child:ListView.builder(itemCount: state.movies.length,itemBuilder: (context, index) {
                return Container(alignment: const Alignment(0, 10),
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(getImageUrl(state.movies[index].poster)))),
                  child: Text(state.movies[index].title,style: Theme.of(context).textTheme.bodyLarge,),
                );
              },)
              
              //  Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text(state..name),
              //     Text(state.county.population.toString()),
              //     Image.network(state.county.flags.first)
              //   //  Text(state.county.flags.first),
              //  ,   ElevatedButton(
              //       onPressed: () {
              //         countryBloc.add( CountryResetEvent());
              //       },
              //       child: const Text("Reset"),
              //     )
              //   ],
              // ),
            );
          }
          return Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Get Movies"),
              ElevatedButton(
                onPressed: () {
                 // countryBloc.add(CountryResetEvent());
                },
                child: const Text("Reset"),
              )
            ],
          ));
        },
      ),
    );
  }
}
