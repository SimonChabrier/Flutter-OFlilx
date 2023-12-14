import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:oflix/views/profil_view.dart';
import 'package:oflix/views/movies_view.dart';
import 'package:oflix/views/movie_view.dart';
import 'package:oflix/views/notifications_view.dart';
import 'package:oflix/views/search_view.dart';

abstract class AppRouter {
  static GoRouter getRouter(BuildContext context) =>
      GoRouter(initialLocation: '/', routes: [
        GoRoute(
          path: '/',
          name: MoviesView.pageName,
          builder: (context, state) => const MoviesView(title: 'OFlix'),
        ),
        GoRoute(
          path: '/profil',
          name: ProfilView.pageName,
          builder: (context, state) => const ProfilView(),
        ),
        GoRoute(
          path: '/notifications',
          name: NotificationsView.pageName,
          builder: (context, state) => const NotificationsView(),
        ),
        GoRoute(
          path: '/search',
          name: SearchView.pageName,
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(
          path: '/movie/:id',
          name: MovieView.pageName,
          builder: (context, state) =>
              MovieView(title: 'Détail', id: state.pathParameters['id']!),
        ),
      ]);
}
