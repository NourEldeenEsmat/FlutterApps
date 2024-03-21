import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/search.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: '/BookView',
      //   builder: (context, state) => const BookDetailsView(),
      // ),
      GoRoute(
        path: '/Search',
        builder: (context, state) => Search(),
      ),
    ],
  );
}
