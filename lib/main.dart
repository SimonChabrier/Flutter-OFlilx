import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflix/bloc/movies/movies_cubit.dart';
import 'package:oflix/core/router.dart';
import 'data/movies/movies_data_source.dart';
import 'services/movie_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit(),
      child: MaterialApp.router(
        title: 'Oflix',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.getRouter(context),
      ),
    );
  }
}
