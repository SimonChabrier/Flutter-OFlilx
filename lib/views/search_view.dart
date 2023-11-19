// page des resulatats de recherche

import 'package:flutter/material.dart';
import 'package:oflix/widgets/top_app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  static const pageName = 'search';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopAppBar(
        title: 'Recherche',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Recherche'),
          ],
        ),
      ),
    );
  }
}
