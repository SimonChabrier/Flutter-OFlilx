import 'package:oflix/data/movies/movies_data_source.dart';
import 'package:oflix/models/movie_model.dart';

class MovieService {
  // On injecte le MoviesDataSource dans le MovieService
  final MoviesDataSource moviesDataSource;
  // On initialise le MovieService avec le MoviesDataSource
  MovieService(this.moviesDataSource);
  // On crée une méthode pour récupérer les films depuis le MoviesDataSource
  Future<List<MovieModel>> fetchMovies() async {
    // On utilise le MoviesDataSource injecté
    try {
      // On utilise la méthode fetchMovies() du MoviesDataSource
      return await MoviesDataSource.fetchMovies();
    } catch (e) {
      // Gérer les erreurs de manière appropriée
      return Future.error(e);
    }
  }
}
