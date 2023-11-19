// retourne le widget de la AppBar avec les boutons de navigation

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// on utilise le mixin PreferredSizeWidget pour définir la taille de la AppBar (kToolbarHeight)
class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.home),
        onPressed: () {
          //  affiche la page d'accueil
          context.goNamed('home');
          debugPrint('Home');
        },
      ),
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            //  affiche la page de recherche
            context.goNamed('search');
            debugPrint('Recherche');
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            context.goNamed('notifications');
            debugPrint('Notifications');
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            context.goNamed('profil');
            debugPrint('Profil');
          },
        ),
      ],
    );
  }
}
