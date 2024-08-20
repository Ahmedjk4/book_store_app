import 'package:book_store/constants.dart';
import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/core/utils/app_theme.dart';
import 'package:book_store/core/utils/service_locator.dart';
import 'package:book_store/features/home/data/repos/home_repo_impl.dart';
import 'package:book_store/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_store/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: AppTheme.darkTheme,
        title: 'Bookly Store',
      ),
    );
  }
}
