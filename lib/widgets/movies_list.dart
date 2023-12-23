import 'package:flutter/material.dart';
import 'package:oflix/models/movie_model.dart';
import 'package:oflix/widgets/movie_card.dart';

class MoviesList extends StatelessWidget {
  final MovieModel movie;
  final List<MovieModel> movies;
  const MoviesList({Key? key, required this.movie, required this.movies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 25.0,
          runSpacing: 25.0,
          children: movies.map((movie) => MovieCard(movie: movie)).toList(),
        ),
      ),
    );
  }
}
