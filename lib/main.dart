import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.darkTheme,
      title: 'Bookly Store',
    );
  }
}
