import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oflix/models/movie_model.dart';
import 'package:oflix/widgets/star_rating.dart';
import 'package:oflix/bloc/movies/movies_cubit.dart';

class MovieDetail extends StatelessWidget {
  final MovieModel movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 300, // Ajustez la largeur selon vos besoins
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StarRating(rating: movie.voteAverage / 2, starSize: 16.0),
                    const SizedBox(width: 8.0),
                    Text(
                      'Sortie: ${movie.releaseDate}',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 300, // Ajustez la largeur selon vos besoins
                child: Text(
                  'Synopsis ${movie.overview}',
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  context.goNamed('home');
                  final moviesCubit = context.read<MoviesCubit>();
                  moviesCubit.loadMovies();
                },
                child: const Text('Retour'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
