import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/utils/get_image_url.dart';
import 'package:sizer/sizer.dart';

class MoviesDetailScreen extends StatefulWidget {
  const MoviesDetailScreen({super.key});

  @override
  State<MoviesDetailScreen> createState() => _MoviesDetailScreenState();
}

class _MoviesDetailScreenState extends State<MoviesDetailScreen> {
  @override
  void dispose() {
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
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              moviesBloc.add(MoviesResetEvent());
            },
            icon: const Icon(Icons.arrow_back_ios_sharp)),
        title: const Text("Movie Detail"),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        bloc: moviesBloc,
        builder: (context, state) {
          if (state is MoviesDetailsFailureState) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No data found"),
                ],
              ),
            );
          } else if (state is MoviesDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MoviesDeatilsLoadedState) {
            return Column(
              children: [
                Container(
              height: 20.h,
              alignment: const Alignment(0, 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(getImageUrl(state.movie.poster)))),
              child: Text(
                state.movie.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),Text(state.movie.overview,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium,)
             ,state.trailers.isNotEmpty? Text("tariler key : ${state.trailers.first.key}"):Text("tariler key :0")
              ,],
            );
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
