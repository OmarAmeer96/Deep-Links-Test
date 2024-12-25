import 'package:app_links/app_links.dart';
import 'package:deep_links_test/error_page.dart';
import 'package:deep_links_test/home_page.dart';
import 'package:deep_links_test/landing_page.dart';
import 'package:deep_links_test/product_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    listenToDeepLinks();
    super.initState();
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/landing',
        builder: (context, state) => LandingPage(),
      ),
      GoRoute(
        path: '/products/:id',
        builder: (context, state) {
          final productId = state.params['id'];
          return ProductPage(productId: productId);
        },
      ),
      GoRoute(
        path: '/error',
        builder: (context, state) => ErrorPage(error: state.error.toString()),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
      ),
      routerConfig: _router,
      title: 'Deep Linking Example',
    );
  }

  void listenToDeepLinks() {
    final appLinks = AppLinks();
    appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _router.go(uri.path);
      }
    });
  }
}
