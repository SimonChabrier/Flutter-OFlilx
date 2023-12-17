import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflix/models/movie_model.dart';
import 'package:oflix/services/movie_service.dart';
import 'package:oflix/data/movies/movies_data_source.dart';
import 'movies_state.dart';

// Events
abstract class MoviesEvent {}

class LoadMoviesEvent extends MoviesEvent {
  LoadMoviesEvent();
}

// Cubit
class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesLoadingState());

  Future<void> loadMovies() async {
    debugPrint('loadMovies');
    emit(MoviesLoadingState());
    try {
      debugPrint('loadMovies');
      final List<MovieModel> movies = await MovieService(
        MoviesDataSource(),
      ).fetchMovies();
      emit(MoviesStateSuccess(movies));
    } catch (error) {
      emit(MoviesStateError(error.toString()));
    }
  }

  void loadMovieById(int id) async {
    debugPrint('cubit');
    debugPrint('id: $id');
    emit(MovieLoadingState());
    try {
      debugPrint('loadMovieById');
      final MovieModel movie = await MovieService(
        MoviesDataSource(),
      ).fetchMovieById(id);
      emit(MovieStateSuccess(movie));
    } catch (error) {
      emit(MovieStateError(error.toString()));
    }
  }
}
