import 'package:oflix/models/movie_model.dart';

abstract class MoviesState {}

class MoviesInitialState extends MoviesState {
  // gérer ici la logique d'un état initial si besoin
}

class MoviesLoadingState extends MoviesState {
  // gérer ici la logique d'un état de chargement si besoin
  // retourner un spinner par exemple
}

class MoviesStateError extends MoviesState {
  // on initialise une String pour stocker le message d'erreur
  final String error;
  // on ajoute un constructeur pour pouvoir passer le message d'erreur
  MoviesStateError(this.error);
}

class MoviesStateSuccess extends MoviesState {
  final MovieModel movie;
  // on ajoute une liste de films pour stocker les films récupérés depuis le service
  // ils sont retournés par le cubit qui apelle le service
  final List<MovieModel> movies;
  // on ajoute un constructeur pour pouvoir passer la liste de films
  // c'est le cubut qui va emit cet état avec la liste de films
  // il es ensuite récupéré par le MoviesView qui va afficher les films
  MoviesStateSuccess(this.movie, this.movies);
}

// le cas où on veut afficher un film par son id
// on va créer un état spécifique pour afficher un film

class MovieStateSuccess extends MoviesState {
  // on ajoute une liste de films pour stocker les films récupérés depuis le service
  // ils sont retournés par le cubit qui apelle le service
  final MovieModel movie;

  MovieStateSuccess(this.movie);
}

class MovieStateError extends MoviesState {
  // on initialise une String pour stocker le message d'erreur
  final String error;
  // on ajoute un constructeur pour pouvoir passer le message d'erreur
  MovieStateError(this.error);
}

class MovieLoadingState extends MoviesState {
  // gérer ici la logique d'un état de chargement si besoin
  // retourner un spinner par exemple
}

class MovieInitialState extends MoviesState {
  // gérer ici la logique d'un état initial si besoin
}
