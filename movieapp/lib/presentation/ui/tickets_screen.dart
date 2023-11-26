import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/utils/colors.dart';
import 'package:sizer/sizer.dart';

import 'ticket_payment_screen.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  List<String> dateList = [
    "5 Mar",
    "6 Mar",
    "7 Mar",
    "8 Mar",
    "9 Mar",
    "10 Mar"
  ];
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
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: CustomColors.fillcolor,
              snap: false,
              pinned: false,
              floating: false, centerTitle: true,
              title: Container(
                margin: EdgeInsets.only(top: 23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "The King's Man",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: CustomColors.blackTextColor),
                    ),
                    Text(
                      "In theaters december 22, 2021",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: CustomColors.blueTextColor),
                    ),
                  ],
                ),
              ),
              // flexibleSpace: FlexibleSpaceBar(
              //     centerTitle: true,

              //     background: Container(
              //       decoration: BoxDecoration(

              //       ),
              //       child: Container(
              //           padding: EdgeInsets.only(bottom: 20),
              //           decoration: BoxDecoration(
              //               gradient: CustomColors.lineargradient),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Text(
              //                   "In theaters",
              //                   style:
              //                       Theme.of(context).textTheme.titleMedium,
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 250,
              //                 child: ElevatedButton(
              //                     style: ButtonStyle(
              //                         backgroundColor:
              //                             MaterialStateProperty.all<Color>(
              //                                 CustomColors.blueTextColor),
              //                         foregroundColor:
              //                             MaterialStateProperty.all<Color>(
              //                                 CustomColors.fillcolor),
              //                         shape: MaterialStateProperty.all<
              //                                 RoundedRectangleBorder>(
              //                             RoundedRectangleBorder(
              //                                 borderRadius:
              //                                     BorderRadius.circular(
              //                                         8.0),
              //                                 side: BorderSide(color: CustomColors.blueTextColor)))),
              //                     onPressed: () {},
              //                     child: Text("Get Tickets")),
              //               ),

              //             ],
              //           )),
              //     ) //Images.network
              //     ), //FlexibleSpaceBar
              expandedHeight: 10.h,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,size: 30,
                  color: CustomColors.blackTextColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ), //IconButton
            ), //SliverAppBar
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => 
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text("Date",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: CustomColors.blackTextColor),),
                       
                          Container(
                            height: 50,margin: EdgeInsets.symmetric(vertical: 20),
                            child: ListView.builder(
                              itemCount: dateList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: Text(
                                    dateList[index],
                                    style:index == 0? Theme.of(context).textTheme.bodySmall:Theme.of(context).textTheme.bodySmall!.copyWith(color: CustomColors.blackTextColor,)
                                  ),
                                  decoration: BoxDecoration(
                                      color: index == 0
                                          ? CustomColors.blueTextColor
                                          : CustomColors.textColor,
                                      borderRadius: BorderRadius.circular(10)),
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            height: 210,
                            child: ListView.builder(
                              itemCount: dateList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "12:30 ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                 
                                                    color: CustomColors
                                                        .blackTextColor),
                                          ),
                                          Text("Cinetech + hall 1",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                      color: CustomColors
                                                          .bodyTextColor))
                                        ],
                                      ),
                                      Container(
                                        width: 300,
                                        height: 150,
                                        alignment: Alignment.center,
                                        margin:
                                            const EdgeInsets.only(right: 10,top: 10,bottom: 10),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: GridView.count(
                                          padding: EdgeInsets.zero,
                                          crossAxisCount: 10,
                                          children: List.generate(
                                            50,
                                            (index) {
                                              return Icon(
                                                Icons.square_outlined,
                                                size: 12,
                                              );
                                            },
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    CustomColors.blueTextColor),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: "From ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                      color: CustomColors
                                                          .bodyTextColor),
                                              children: [
                                            TextSpan(
                                                text: "50\$",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: CustomColors
                                                            .blackTextColor)),
                                            TextSpan(
                                                text: " or",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!
                                                    .copyWith(
                                                        color: CustomColors
                                                            .bodyTextColor)),
                                            TextSpan(
                                                text: " 2500 bonus",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: CustomColors
                                                            .blackTextColor))
                                          ]))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 30.h,),
                  
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              side: BorderSide(
                                                  color: CustomColors
                                                      .blueTextColor)))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TicketsPaymentsScreen(),
                                        ));
                                  },
                                  child: Text("Select seat",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: CustomColors.fillcolor,
                                          )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), //Text
                  //Center
                 //ListTile
                childCount: 1,
              ), //SliverChildBuildDelegate
            ) //SliverList
          ], //<Widget>[]
        ));
  }
}
