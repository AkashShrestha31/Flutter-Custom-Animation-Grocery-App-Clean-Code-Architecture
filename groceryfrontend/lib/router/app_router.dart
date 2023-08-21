import 'package:go_router/go_router.dart';
import 'package:groceryfrontend/features/mainscreen/presentations/pages/main_screen.dart';

class AppRoute {
  AppRoute._();

  static GoRouter goRouter = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        GoRoute(
            path: '/',
            name: 'login',
            builder: (context, state) => const MainScreen()),
        // GoRoute(
        //     path: '/signUp',
        //     name: 'signUp',
        //     builder: (context, state) => const SingUpPage()),
        //   GoRoute(
        //     path: '/main',
        //     name: 'main',
        //     builder: (context, state) => const MainPages()),
        //
        // GoRoute(
        //     path: '/policy',
        //     name: 'policy',
        //     builder: (context, state) => const PoliciesPage()),
        // GoRoute(
        //     path: '/policy-details',
        //     name: 'policy-details',
        //     builder: (context, state) => const PlanDetailsPage()),
        // GoRoute(
        //     path: '/all-categories',
        //     name: 'all-categories',
        //     builder: (context, state) => const AllCategoriesPage())
        //
      ]);
}
