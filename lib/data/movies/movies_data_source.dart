import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oflix/data/config/api_config.dart';
import 'package:oflix/models/movie_model.dart';

class MoviesDataSource {
  // méthode statique pour récupérer les filmsWXXW
  // je vais l'apeller dans le service MovieService
  // c'est le Cubit qui va appeler le service en fonction de l'état de l'application
  // On attend ici un type List de MovieModel
  static Future<List<MovieModel>> fetchMovies() async {
    const baseUrl =
        'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConfig.apiKey}';
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        //debugPrint('data: $data');
        // On déclare une variable results qui est une liste dynamique
        // qu'on initialise avec la valeur de la clé 'results' du json
        // <dynamic> veut dire que la liste peut contenir n'importe quel type de données (int, String, bool, etc.)
        final List<dynamic> results = data['results'];
        //debugPrint('results: $results');
        // On déclare une variable movies qui est une liste de MovieModel
        // qu'on initialise avec la liste results ne utilisant la méthode map pour transformer chaque élément de la liste results en MovieModel
        final movies =
            results.map((json) => MovieModel.fromJson(json)).toList();
        // On retourne la liste movies
        return movies;
      } else {
        throw Exception(
            'Failed to load movies. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movies. Error: $e');
    }
  }

  // méthode statique pour récupérer un film par son id
  // je vais l'apeller dans le service MovieService
  static Future<MovieModel> fetchMovieById(int id) async {
    // bloc try/catch pour gérer les erreurs de manière appropriée
    try {
      final String movieUrl =
          'https://api.themoviedb.org/3/movie/$id?api_key=${ApiConfig.apiKey}';

      final response = await http.get(Uri.parse(movieUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final MovieModel movie = MovieModel.fromJson(
            data); // Utiliser directement MovieModel.fromJson
        debugPrint('movie: $movie');
        debugPrint('movie.title: ${movie.title}');
        return movie;
      } else {
        throw Exception(
            'Failed to load movie. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movie. Error: $e');
    }
  }
}
