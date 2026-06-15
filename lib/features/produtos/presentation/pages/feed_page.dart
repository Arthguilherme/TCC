import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:replaykids/core/routes/app_router.dart';
import 'package:replaykids/core/theme/app_colors.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c50,
      appBar: AppBar(
        backgroundColor: AppColors.c50,
        elevation: 0,
        title: const Text(
          'ReplayKids',
          style: TextStyle(color: AppColors.c900, fontWeight: FontWeight.w700),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: AppColors.c500, size: 64),
            SizedBox(height: 16),
            Text(
              'Login realizado com sucesso!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              'Feed em construção.',
              style: TextStyle(color: AppColors.neutral500),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go(AppRouter.publicar),
        backgroundColor: AppColors.c500,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Publicar anúncio'),
      ),
    );
  }
}