// page de login

import 'package:flutter/material.dart';
import 'package:oflix/widgets/top_app_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  static const pageName = 'notifications';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopAppBar(
        title: 'Notifications',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Notifications'),
          ],
        ),
      ),
    );
  }
}
