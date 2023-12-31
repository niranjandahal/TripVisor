import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisor/Views/landingscree.dart';
import 'package:tripvisor/Views/oneclickplan.dart';
import 'package:tripvisor/Views/packagedetails.dart';
import 'package:tripvisor/Widgets/searchbar.dart';
import 'package:provider/provider.dart';
import 'package:tripvisor/provider/tagprovider.dart';
import 'package:tripvisor/provider/offersectionprovider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => tagprovider()),
      ChangeNotifierProvider(create: (context) => offersectionprovider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LandingScreen(),
      ),
      GoRoute(
        path: '/packagedetails',
        builder: (context, state) => PackageDetails(),
      ),
      GoRoute(
        path: '/oneclickplan',
        builder: (context, state) => OneClickPlan(),
      ),
    ],
  );
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Tripvisor',
    );
  }
}
