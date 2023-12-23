import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflix/bloc/movies/movies_cubit.dart';
import 'package:oflix/bloc/movies/movies_state.dart';
import 'package:oflix/widgets/movie_detail.dart';
import 'package:oflix/widgets/top_app_bar.dart';
import 'package:oflix/widgets/section_title.dart';
import 'package:oflix/widgets/spinner.dart';

import '../widgets/movie_cards.dart';
import '../widgets/movies_list.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key, required this.title, required this.id})
      : super(key: key);

  static const pageName = 'MoviesView';
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    // on récupère le MoviesCubit depuis le contexte en utilisant context.read<MoviesCubit>()
    // on le stocke dans une variable pour pouvoir l'utiliser plus tard
    final moviesCubit = context.read<MoviesCubit>();
    // on appelle la méthode loadMovies() du MoviesCubit sur la variable créée précédemment
    moviesCubit.loadMovieById(int.parse(id));
    // on retourne un Scaffold avec un TopAppBar et un MoviesList
    return Scaffold(
      appBar: TopAppBar(title: title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SectionTitle(title: "Détails du film"),
            BlocBuilder<MoviesCubit, MoviesState>(
              builder: (context, state) {
                if (state is MovieLoadingState) {
                  debugPrint('MovieLoadingState');
                  return const LoadingIndicator();
                } else if (state is MovieStateError) {
                  debugPrint('MovieStateError');
                  return Center(
                    child: Text('Erreur ${state.error}'),
                  );
                } else if (state is MovieStateSuccess) {
                  debugPrint('MovieStateSuccess');
                  return MovieDetail(movie: state.movie);
                } else if (state is MoviesStateSuccess) {
                  debugPrint('MoviesStateSuccess');
                  return MoviesList(movie: state.movie, movies: state.movies);
                } else {
                  debugPrint('Container');
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
