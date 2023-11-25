import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/presentation/ui/movies_screen.dart';
import 'package:movieapp/utils/colors.dart';
import 'package:sizer/sizer.dart';

import 'injection_container.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(sl(),sl(),sl(),sl()),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(fontFamily: 'Popins',
 textTheme: TextTheme(titleMedium: TextStyle(color: CustomColors.fillcolor,fontWeight: FontWeight.w500)),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MoviesScreen(),
          );
        }
      ),
    );
  }
}

