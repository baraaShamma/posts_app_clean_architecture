import 'package:go_router/go_router.dart';
import 'package:posts_app_clean_architecture/app/navigation/app_route.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/screen/login_screen.dart';
import 'package:posts_app_clean_architecture/features/posts/presentation/screen/posts_screen.dart';

class AppRouterConfig {
  static final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutesPaths.login,
      routes: [
        GoRoute(
          path: RoutesPaths.login,
          name: RoutesNames.login,
          builder: (context, state) => const LoginScreen(),
        ),     GoRoute(
          path: RoutesPaths.postsScreen,
          name: RoutesNames.postsScreen,
          builder: (context, state) => const PostsScreen(),
        ),

      ]);
}
