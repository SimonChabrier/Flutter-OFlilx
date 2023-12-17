import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflix/bloc/movies/movies_cubit.dart';
import 'package:oflix/bloc/movies/movies_state.dart';
import 'package:oflix/widgets/movies_list.dart';
import 'package:oflix/widgets/top_app_bar.dart';
import 'package:oflix/widgets/section_title.dart';
import 'package:oflix/widgets/spinner.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key, required this.title}) : super(key: key);

  static const pageName = 'home';
  final String title;

  @override
  Widget build(BuildContext context) {
    final moviesCubit = context.read<MoviesCubit>();
    moviesCubit.loadMovies();

    return Scaffold(
      appBar: TopAppBar(title: title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SectionTitle(title: "LIste des films"),
            BlocBuilder<MoviesCubit, MoviesState>(
              builder: (context, state) {
                if (state is MoviesLoadingState) {
                  debugPrint('MoviesLoadingState');
                  return const LoadingIndicator();
                } else if (state is MoviesStateError) {
                  return Center(
                    child: Text('Erreur ${state.error}'),
                  );
                } else if (state is MoviesStateSuccess) {
                  return MoviesList(movies: state.movies);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
