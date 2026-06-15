import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/produtos/presentation/pages/feed_page.dart';
import '../../features/anuncio/presentation/pages/publish_step1_page.dart';

class AppRouter {
  static const login = '/login';
  static const cadastro = '/cadastro';
  static const feed = '/feed';
  static const publicar = '/publicar'; 
  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: cadastro,
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: feed,
        builder: (context, state) => const FeedPage(),
      ),
      GoRoute(
        path: publicar,
        builder: (context, state) => const PublishStep1Page(),
      ),
    ],
  );
}