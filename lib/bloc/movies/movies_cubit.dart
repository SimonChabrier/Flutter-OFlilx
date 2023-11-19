import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflix/models/movie_model.dart';
import 'package:oflix/services/movie_service.dart';
import 'movies_state.dart';

// Events
abstract class MoviesEvent {}

class LoadMoviesEvent extends MoviesEvent {
  LoadMoviesEvent();
}

// Cubit
class MoviesCubit extends Cubit<MoviesState> {
  final MovieService movieService;

  // on injecte le service dans le cubit via le constructeur
  // super permet d'appeler le constructeur de la classe parente
  MoviesCubit({required this.movieService}) : super(MoviesLoadingState());

  // une variable pour stocker l'état de chargement des films
  bool isLoading = true;

  void loadMovies() async {
    try {
      debugPrint('loadMovies');
      // on récupère les films depuis le service et on les stocke dans une variable
      final List<MovieModel> movies = await movieService.fetchMovies();
      // on émet un état de succès avec les films récupérés depuis le service que l'on vient de stocker dans la variable movies
      // on passe movies en paramètre de MoviesStateSuccess qui retournera la liste de films
      emit(MoviesStateSuccess(movies));
    } catch (error) {
      // on émet un état d'erreur avec le message d'erreur
      emit(MoviesStateError(error.toString()));
    } finally {
      // Je désactive le chargement, que l'appel réussisse ou échoue
      isLoading = false;
    }
  }
}
