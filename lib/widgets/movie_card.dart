import 'package:flutter/material.dart';
import 'package:oflix/models/movie_model.dart';
import 'package:oflix/widgets/star_rating.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w300${movie.posterPath}',
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            movie.title.length > 40
                ? '${movie.title.substring(0, 40)}...'
                : movie.title,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          StarRating(rating: movie.voteAverage / 2, starSize: 16.0),
          const SizedBox(height: 8.0),
          Text(
            'Sortie: ${movie.releaseDate}',
            style: const TextStyle(fontSize: 12.0),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Synopsis ${movie.overview.length > 150 ? '${movie.overview.substring(0, 120)}...' : movie.overview}',
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
