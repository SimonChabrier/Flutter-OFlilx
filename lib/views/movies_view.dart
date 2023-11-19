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
    // on récupère le MoviesCubit depuis le contexte en utilisant context.read<MoviesCubit>()
    // on le stocke dans une variable pour pouvoir l'utiliser plus tard
    final moviesCubit = context.read<MoviesCubit>();
    // on appelle la méthode loadMovies() du MoviesCubit sur la variable créée précédemment
    moviesCubit.loadMovies();
    // on retourne un Scaffold avec un TopAppBar et un MoviesList
    return Scaffold(
      appBar: TopAppBar(title: title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SectionTitle(title: "Continuer de regarder"),
            BlocBuilder<MoviesCubit, MoviesState>(
              builder: (context, state) {
                if (state is MoviesLoadingState) {
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
