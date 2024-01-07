import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisor/Views/landingscree.dart';
import 'package:tripvisor/Widgets/searchbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LandingScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => customsearchbar(),
      ),
    ],
  );
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Tripvisor',
    );
  }
}
