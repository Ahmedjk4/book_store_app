import 'package:book_store/core/utils/service_locator.dart';
import 'package:book_store/features/home/data/models/book_model/book_model.dart';
import 'package:book_store/features/home/data/repos/home_repo_impl.dart';
import 'package:book_store/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_store/features/home/presentation/views/book_details_view.dart';
import 'package:book_store/features/home/presentation/views/home_view.dart';
import 'package:book_store/features/search/data/repos/search_repo_impl.dart';
import 'package:book_store/features/search/presentation/view_models/search_books_cubit/search_cubit_cubit.dart';
import 'package:book_store/features/search/presentation/views/search_view.dart';
import 'package:book_store/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

abstract class AppRouter {
  static const String homePath = '/home';
  static const String bookDetailsPath = '/bookDetails';
  static const String searchViewPath = '/search';

  static final router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: '/bookDetails',
        pageBuilder: (context, state) => buildPageWithTurnTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => SimilarBooksCubit(
              getIt.get<HomeRepoImpl>(),
            ),
            child: BookDetailsView(
              book: state.extra as BookModel,
            ),
          ),
        ),
      ),
      GoRoute(
        path: '/search',
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => SearchBooksCubit(
              getIt.get<SearchRepoImpl>(),
            ),
            child: const SearchView(),
          ),
        ),
      ),
    ],
  );
}

CustomTransitionPage buildPageWithFadeTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage buildPageWithTurnTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        TurnPageTransition(
      animation: animation,
      overleafColor: Colors.white,
      child: child,
    ),
  );
}
