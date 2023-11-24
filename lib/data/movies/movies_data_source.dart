import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oflix/data/config/api_config.dart';
import 'package:oflix/models/movie_model.dart';

const _baseUrl =
    'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConfig.apiKey}';

class  MoviesDataSource {
  // méthode statique pour récupérer les films
  // je vais l'apeller dans le service MovieService
  // c'est le Cubit qui va appeler le service en fonction de l'état de l'application
  // On attend ici un type List de MovieModel
  static Future<List<MovieModel>> fetchMovies() async {
    // bloc try/catch pour gérer les erreurs de manière appropriée
    try {
      final response = await http.get(Uri.parse(_baseUrl));

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
}
