import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/presentation/ui/tickets_screen.dart';
import 'package:movieapp/utils/colors.dart';
import 'package:sizer/sizer.dart';

import '../../utils/get_date_format.dart';
import 'widgets/video_player.dart';

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
            return CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  snap: false,
                  pinned: false,
                  floating: false,
                  title: Text(
                    "Watch",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      //Text
                      background: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/${state.movie.poster}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                            padding: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                gradient: CustomColors.lineargradient),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "In theaters ${getDateFormate(state.movie.releaseDate)}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  CustomColors.blueTextColor),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  CustomColors.fillcolor),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  side: BorderSide(
                                                      color: CustomColors
                                                          .blueTextColor)))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const TicketsScreen(),
                                            ));
                                      },
                                      child: Text("Get Tickets",style: Theme.of(context).textTheme.labelLarge,)),
                                ),
                                state.trailers.isNotEmpty
                                    ? SizedBox(
                                        width: 250,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        CustomColors
                                                            .blueTextColor
                                                            .withOpacity(0.0)),
                                                foregroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        CustomColors.fillcolor),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        side: BorderSide(color: CustomColors.blueTextColor)))),
                                            onPressed: () {
                                              if (MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait) {
                                                SystemChrome
                                                    .setPreferredOrientations([
                                                  DeviceOrientation
                                                      .landscapeLeft
                                                ]);
                                              }
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 200,
                                                    child:
                                                        PlayerVideoAndPopPage(
                                                            url: state.trailers
                                                                .first.key),
                                                  );
                                                },
                                              );
                                            },
                                            child:  Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                               const Icon(Icons.play_arrow,size: 18,),
                                                Text("Watch Trailer",style: Theme.of(context).textTheme.labelLarge,),
                                              ],
                                            )),
                                      )
                                    : const SizedBox()
                              ],
                            )),
                      ) //Images.network
                      ), //FlexibleSpaceBar
                  expandedHeight: 40.h,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,size: 30,
                      color: CustomColors.fillcolor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      moviesBloc.add(MoviesResetEvent());
                    },
                  ), //IconButton
                ), //SliverAppBar
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                      title: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Genres",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: CustomColors.blackTextColor),),
                            const  SizedBox(height: 10,),
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  itemCount: state.movie.genres.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 20),margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                                        color: index == 0 || index == 6
                                            ? CustomColors.blueTextColor
                                            : index == 1
                                                ? CustomColors.pinkAppColor
                                                : index == 2 || index == 5
                                                    ? CustomColors
                                                        .violetAppColor
                                                    : index == 3
                                                        ? CustomColors
                                                            .yellowAppColor
                                                        : CustomColors
                                                            .greenAppColor,
                                      ),
                                      child: Text(
                                        state.movie.genres[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    );
                                  },
                                ),
                              ),
                               Divider(
                                thickness: 1,color: CustomColors.labelTextColor,
                                height: 25,
                              ),
                              Text("Overview",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: CustomColors.blackTextColor),),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 90.w,
                                child: Text(
                                  state.movie.overview,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400,color: CustomColors.bodyTextColor),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          ),
                        ), //Text
                      ), //Center
                    ), //ListTile
                    childCount: 1,
                  ),
                )
              ], //<Widget>[]
            );
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Get Movies"),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Reset"),
              )
            ],
          ));
        },
      ),
    );
  }
}
