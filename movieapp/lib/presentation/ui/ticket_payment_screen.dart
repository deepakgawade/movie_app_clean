import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/utils/colors.dart';
import 'package:sizer/sizer.dart';

class TicketsPaymentsScreen extends StatefulWidget {
  const TicketsPaymentsScreen({super.key});

  @override
  State<TicketsPaymentsScreen> createState() => _TicketsPaymentsScreenState();
}

class _TicketsPaymentsScreenState extends State<TicketsPaymentsScreen> {
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
                margin: const EdgeInsets.only(top: 23),
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
                      "March 5, 2021 I 12:30 hall 1",
                      style:  Theme.of(context)
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
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: 40.h,),
                    
                     const Column(
                        children: [
                          Row(
                            children: [
                              IconLabel(image: "Seat.png",text: "Selected",), SizedBox(width: 10,) ,IconLabel(image: "Seat5.png",text: "Not available",)
                            ],
                          ),
                            Row(
                            children: [
                              IconLabel(image: "Seat2.png",text: "VIP (\$150)",), SizedBox(width: 10,) ,IconLabel(image: "Seat4.png",text: "Regular (50\$)",)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            decoration: BoxDecoration(
                                color: CustomColors.textColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: RichText(
                              text: TextSpan(
                                  text: "Total Price\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 10,
                                        fontWeight: FontWeight.w400,letterSpacing: -0.2,
                                        color: CustomColors.blackTextColor,
                                      ),
                                  children: [
                                    TextSpan(
                                        text: "\$ 50",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors.blackTextColor,letterSpacing: 0.2
                                            ))
                                  ]),
                            ),
                          ),
                          SizedBox(
                            width: 200,
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
                              child: Text("Proceed to pay",
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

                childCount: 1,
              ),
            )
          ],
        ));
  }
}

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key, required this.text, required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset("assets/$image"),
        const  SizedBox(
            width: 10,
          ),
          Text(
            text,
            style:
                Theme.of(context).textTheme.labelMedium!.copyWith(color: CustomColors.bodyTextColor),
          )
        ],
      ),
    );
  }
}
