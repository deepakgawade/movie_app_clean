import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/utils/get_image_url.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors.dart';
import 'movie_detail_screen.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final textController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    textController.dispose();
    _debounce!.cancel();
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
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.fillcolor,
        centerTitle: true, scrolledUnderElevation: 0,
        toolbarHeight: 8.h,
        flexibleSpace: Container(
          width: 80.w,
          margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.onAppBarColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    moviesBloc.add(MovieSearchResetEvent());
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColors.greyIconColor,
                  )),
              Container(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'TV shows, Movies and more',
                      hintStyle: Theme.of(context).textTheme.bodyLarge),
                  controller: textController,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      moviesBloc.add(MovieSearchEvent(keyword: value));
                    });
                  },
                ),
              ),
              IconButton(
                  onPressed: () {
                    textController.clear();
                  },
                  icon: Icon(
                    Icons.close,
                    color: CustomColors.greyIconColor,
                  ))
            ],
          ),
        ),

        // flexibleSpace: Container(color: Colors.amber,
        //   width: 80.w,
        //   child: TextField(controller: textController),
        // ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) => previous != current,
        bloc: moviesBloc,
        builder: (context, state) {
          if (state is MoviesSearchFailureState) {
            //moviesBloc.add(MoviesUpcomingEvent());
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Getting Movies...loading"),
                ],
              ),
            );
          } else if (state is MoviesSearchLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MoviesSearchLoadedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Top Results",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: CustomColors.greyIconColor)),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: CustomColors.greyIconColor,
                    ),
                    ListView.builder(physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const MoviesDetailScreen(),
                            //     ));
                            // moviesBloc.add(MovieDetailEvent(
                            //     movieId: state.movies[index].id.toString()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                width: 40.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      getImageUrl(state.movies[index].poster),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.movies[index].title,
                                        textAlign: TextAlign.left,
                                      ),
                                      Text("Crime"),
                                    ],
                                  )),
                              Text(
                                "...",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.blueTextColor,
                                    fontSize: 20),
                              ),
                         
                            ],
                          ),
                        );
                      },
                    ),   
                   SizedBox(height: 8.h) ],
                ),
              ),
            );
          }
          return const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Find TV shows, Movies and lot more"),
            ],
          ));
        },
      ),
    );
  }
}
